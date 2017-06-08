from twisted.internet.protocol import Factory
from twisted.protocols.basic   import LineReceiver
from twisted.internet          import reactor

from tradingBrain import TradingBrain

class TradingGame(LineReceiver):
    def __init__(self, tradingBrain):
        self.tb = tradingBrain
        self.name = None
        self.state = "GETNAME"

    def connectionMade(self):
        print "Client connected..."

    def connectionLost(self, reason):
        print "Client {0} disconnected...".format(self.name)
        self.tb.removeTeam(self.name)

    def lineReceived(self, line):
        if self.state == "GETNAME":
            self.handle_GETNAME(line)
        elif self.state == "ROUNDSTART":
            self.handle_ROUNDSTART(line)
        elif self.state == "ROUNDEND":
            self.handle_ROUNDEND(line)

    def handle_GETNAME(self, name): 
        if self.tb.addTeam(name, self) is False:
            count = 1 # We know there is one team w/ same name

            for teamname in self.tb.teams.keys():
                if teamname.startswith(name): # Count all clients w/ same prefix
                    count += 1

            # Append count to name
            name = name + str(count)
            self.tb.addTeam(name, self)
            return
        
        self.name = name
        print "Welcome {0}!".format(name)

        # Send each newly connected team their list of items
        itemMsg = "ITEMS:" + self.tb.itemList(self.tb.numTeams - 1)
        self.sendLine(itemMsg)

        if self.tb.allTeamsConnected():
            allConnectedMsg = "ROUNDSTART:" + str(self.tb.currentRound+1) + ";" + str(self.tb.roundTime)
            
            for (name, team) in self.tb.teams.iteritems():
                team.state = "ROUNDSTART"
                team.sendLine(allConnectedMsg)

    def handle_ROUNDSTART(self, msg):
        data = msg.split(':')

        event = data[0]
        
        if event == "TRANS_REQUEST" or "TRANS_REPLY":
            requestee = data[2]
            self.tb.teams[requestee].sendLine(msg)

        elif event == "ROUNDEND":
            # if roundend_cnt < 12
            #    update score for this client
            # else
            self.state = "ROUNDEND"

            if self.tb.nextRound() is False:
                # send leader board
                # wait one minute
                # end game
                ;
            else:
                # send leader board
                # wait one minute
                # start next round

        if event == "TRANSACTION":
            transaction = data[1].split(';')

            client = transaction[0]
          
            infocards = self.tb.replaceIndexWithInfoCards(transaction[8:])
            transaction[8:] = infocards

            newMsg = ";".join(transaction)

            self.tb.teams[client].sendLine(event + ":" + newMsg)

class TradingGameFactory(Factory):
    def __init__(self):
        maxTeams = 3
        maxRounds = 4
        self.tb = TradingBrain(maxTeams, maxRounds)

    def buildProtocol(self, addr):
        return TradingGame(self.tb)

reactor.listenTCP(1024, TradingGameFactory())
reactor.run()
