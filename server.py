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
        self.sendLine("OUTPUT:Choose a team name.")

    def connectionLost(self, reason):
        self.tb.removeTeam(self.name)

    def lineReceived(self, line):
        if self.state == "GETNAME":
            self.handle_GETNAME(line)
        elif self.state == "TRANSACTION":
            self.handle_TRANSACTION(line)
        elif self.state == "ROUNDEND":
            self.handle_ROUNDEND(line)

    def handle_GETNAME(self, name): 
        if self.tb.addTeam(name, self) is False:
            self.sendLine("OUTPUT:Name taken, please choose another.")
            return
        
        self.sendLine("OUTPUT:Welcome, %s!" % (name,))
        self.name = name

        if self.tb.allTeamsConnected():
            self.state = "TRANSACTION"

            msg = "ROUNDSTART:" + str(self.tb.currentRound+1) + "," + str(self.tb.roundTime)

            for (name, team) in self.tb.teams.iteritems():
                team.sendLine(msg)

    def handle_TRANSACTION(self, msg):
        data = msg.split(':')

        event = data[0]

class TradingGameFactory(Factory):
    def __init__(self):
        maxTeams = 2
        maxRounds = 4
        self.tb = TradingBrain(maxTeams, maxRounds)

    def buildProtocol(self, addr):
        return TradingGame(self.tb)

reactor.listenTCP(1024, TradingGameFactory())
reactor.run()
