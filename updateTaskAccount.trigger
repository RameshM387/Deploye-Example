trigger updateTaskAccount on Task (After Update) {
    if(trigger.isAfter && trigger.isUpdate){
    TaskTriggerHandler.UpdateAccountActive(Trigger.new);
    }
}