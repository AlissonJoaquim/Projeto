trigger oppTrig on Lead (after update) {
    for(Lead newLead: Trigger.new) {
        Lead oldlead = Trigger.oldMap.get(newLead.Id);
        if(oldLead.Status == 'Contacted' && (newLead.Status == 'In Negociation')) {         
                    // criar tarefa
            Task novaTarefa = new Task();
            novaTarefa.Subject = 'Tentar a conversão nos próximos 10 dias.';
            novaTarefa.WhoId = newLead.Id;
            novaTarefa.ActivityDate = Date.today()+10;
            novaTarefa.OwnerId = newLead.OwnerId;
            novaTarefa.Priority = 'Normal';
            novaTarefa.Status = newLead.Status;
            insert novaTarefa;
        }
    }
}