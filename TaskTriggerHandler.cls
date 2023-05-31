public class TaskTriggerHandler {

    public static void UpdateAccountActive(List<Task> newTask){
        
    set<id> accountIds=new set<id>();
        
    List<PermissionSetAssignment> PSIds = [select AssigneeId from permissionsetAssignment where permissionset.name='CQ_Account_Admin'];
    set<id> userIds = new set<id>();
    for(PermissionSetAssignment ps:PSIds){
        userIds.add(ps.AssigneeId);
    }
    
    string comments;
    for(Task t :newTask){
        if(userIds.contains(UserInfo.getUserId())){
        if(t.Status =='Completed' ){
            accountIds.add(t.WhatId);
            Comments = t.Description;
            system.debug('Nagesh'+Comments );
            system.debug('Nagesh'+accountIds);
        }
        }
    }
    if(!accountIds.isEmpty()){
    List<Account> accountsToUpdate = [Select id, Name, IsActive__c from Account where Id IN: accountIds];
        system.debug('Nagesh'+ accountsToUpdate);
    List<Account> accUpdateList=new List<Account>();
        
    for(Account Acc : accountsToUpdate){
        Acc.IsActive__c = true;
        Acc.Description = comments;
        accUpdateList.add(Acc);
        
    }
        
        if(!accUpdateList.isEmpty()){
    update accUpdateList;
        }
    }
    }
    
}