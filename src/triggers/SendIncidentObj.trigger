trigger SendIncidentObj on IncidentObj__c (after insert)
{
  system.debug('entered trigger');
  for(IncidentObj__c incObj : Trigger.new)
  {
    system.debug('entered for loop in trigger');
    SendIncidentUsingRESTAPI.callcreateAcc(incObj.caseOrigin__c, incObj.id);
    system.debug('exit for loop in trigger');
  }
}