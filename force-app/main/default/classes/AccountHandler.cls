public class AccountHandler {
    public AccountHandler() {

    }

    public static void accountPhoneUpdater(List<Account> triggerAccounts){

        List<Account> newAcc = new List<Account>();

        for (Account acc : triggerAccounts){
            if(acc.Description == 'Cavalcade'){
                acc.Description = 'Cavalcade - CV Ranger assignments needed';
            }else{
                continue;
            }
        }



    }

    public static void addCVRangerAssignmentTask(List<Account> insertedAccounts){

        List<Task> tskList  = new List<Task>();

        
            for (Account currAcc : insertedAccounts){
                if(currAcc.Description=='Cavalcade - CV Ranger assignments needed'){
           
                    Task tsk = new Task();
                    tsk.Subject = 'Other';
                    tsk.Status = 'Not Started';
                    tsk.Priority = 'Normal';
                    tsk.WhatId = currAcc.ID;
                    tsk.Subject = (currAcc.Name + ' needs a new Cavalcade Ranger Assignment!');

                    tskList.add(tsk);
                }
                
                
            }
            Insert tskList;
            }
            
        

        
    

    
}
