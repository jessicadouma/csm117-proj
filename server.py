from twisted.internet.protocol import Factory
from twisted.protocols.basic   import LineReceiver
from twisted.internet          import reactor

from trading_game import TradingBrain

class TradingGame(LineReceiver):
    def __init__(self, tradingBrain):
        self.tb = tradingBrain
        self.name = None
        self.state = "GETNAME"

    def connectionMade(self):
        self.sendLine("Choose a team name.")

    def connectionLost(self, reason):
        self.tb.removeTeam(self.name)

    def lineReceived(self, line):
        if self.state == "GETNAME":
            self.handle_GETNAME(line)
        elif self.state == "TRADE":
            self.handle_TRADE(line)
        elif self.state == "ROUNDSTART":
            self.handle_ROUNDSTART(line)

    def handle_GETNAME(self, name):
        if self.tb.addTeam(name, self) is False:
            self.sendLine("Name taken, please choose another.")
            return
        
        self.sendLine("Welcome, %s!" % (name,))
        self.name = name

        if self.tb.allTeamsConnected():
            self.state = "ROUNDSTART"

            for (name, team) in self.tb.teams.iteritems():
                team.sendLine(self.state)

class TradingGameFactory(Factory):
    def __init__(self):
        self.tb = TradingBrain()

    def buildProtocol(self, addr):
        return TradingGame(self.tb)

reactor.listenTCP(1024, TradingGameFactory())
reactor.run()
