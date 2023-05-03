public with sharing class OpportunityHandler {
    public static void valor10k(List<Opportunity> triggerNew) {
        for(Opportunity newOpp: triggerNew) {
            if(newOpp.Amount > 10000 && newOpp.StageName == 'closed Won') {         
                        // criar tarefa
                Task novaTarefa = new Task();
                novaTarefa.Subject = 'Os produtos devem ser separados e enviados.';
                novaTarefa.WhatId = newOpp.Id;
                novaTarefa.ActivityDate = Date.today()+5;
                novaTarefa.OwnerId = newOpp.OwnerId;
                novaTarefa.Priority = 'Normal';
                novaTarefa.Status = newOpp.StageName;
                insert novaTarefa;
            }
        }
    }
}
