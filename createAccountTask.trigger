trigger createAccountTask on Account (After insert) {
	if(trigger.isAfter && trigger.isInsert){
    AccountTriggerHandler.CreateTaskOnAccount(Trigger.new);
    }
    
}