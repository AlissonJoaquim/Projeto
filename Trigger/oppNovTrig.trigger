Trigger oppNovTrig on Opportunity (before update) {
    for(Opportunity newOpp: Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(newOpp.Id);
        if(oldOpp.StageName == 'Closed Won' || oldOpp.StageName == 'Closed Lost' && 
            (newOpp.StageName != 'Closed Won' || newOpp.StageName != 'Closed Lost')) {
                newOpp.StageName.addError('Uma vez que a Oportunidade foi perdida ou Ganha, o status não pode retroceder.');
        }
    }

    OpportunityHandler.valor10k(Trigger.new);
}
