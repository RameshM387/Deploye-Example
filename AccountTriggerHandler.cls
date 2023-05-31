public class AccountTriggerHandler {
    
    public static void CreateTaskOnAccount(List<Account> newAccount){
        List<task> Tlist = new List<task>();
    DateTime dt = system.Now()+7;
    for(Account Acc: newAccount){
        if(Acc.IsActive__c==False){
            task t = new task();
            t.Subject       = 'Review Account: ' + Acc.Name;
            t.ActivityDate  = dt.date();
            t.OwnerId       = Acc.OwnerId;
            t.Status        = 'Not Started';
            t.WhatId= Acc.id;
            Tlist.add(t);
        }
        if(!Tlist.isEmpty()){
        insert Tlist;
    	}
    }
    }

}