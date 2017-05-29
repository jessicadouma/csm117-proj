class TradingBrain:
    def __init__(self):
        self.numTeams = 0
        self.maxTeams = 2
        self.teams = {}

        self.rounds = 10
        self.currentRound = 0

    def addTeam(self, name, team):
        if name in self.teams:
            return False

        self.teams[name] = team
        self.numTeams += 1
        return True

    def removeTeam(self, name):
        if name in self.teams:
            del self.teams[name]

    def allTeamsConnected(self):
        return self.numTeams == self.maxTeams

    def nextRound(self):
        if self.currentRound < self.rounds:
            self.currentRound += 1
