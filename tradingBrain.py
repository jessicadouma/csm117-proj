import tradingutils as tutils

class TradingBrain:
    def __init__(self, maxTeams, maxRounds):
        self.numTeams = 0
        self.maxTeams = maxTeams
        self.teams = {}

        self.purses = {}
        self.scoreBoard = {}

        self.items = tutils.build_itemlist()

        self.maxRounds = maxRounds
        self.currentRound = 0
        self.roundTime = 10

    def addTeam(self, name, team):
        if name in self.teams:
            return False

        self.teams[name] = team
        self.purses[name] = 0
        self.scoreBoard[name] = 0

        self.numTeams += 1
        return True

    def removeTeam(self, name):
        if name in self.teams:
            del self.teams[name]
            del self.purses[name]
            del self.scoreBoard[name]

            self.numTeams -= 1

    def itemList(self, teamidx):
        return self.items[teamidx]

    def allTeamsConnected(self):
        return self.numTeams == self.maxTeams

    def nextRound(self):
        if self.currentRound < self.maxRounds:
            self.currentRound += 1

    def updateScore(self, name, amt):
            self.scoreBoard[name] += amt
