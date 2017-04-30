trigger SendAccount on Account (after insert)
{
  system.debug('entered trigger');
  for(Account a : Trigger.new)
  {
    system.debug('entered for loop in trigger');
    SendAccountUsingRESTAPI.callcreateAcc(a.Name, a.Id);
    system.debug('exit for loop in trigger');
  }
}