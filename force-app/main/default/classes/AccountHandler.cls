public class AccountHandler {
    public AccountHandler() {

    }

    public static void accountDescriptionUpdater(List<Account> triggerAccounts){


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
                    tsk.WhatId = currAcc.ID;
                    tsk.Priority = 'Normal';
                    tsk.Subject = (currAcc.Name + ' needs a new Cavalcade Ranger Assignment!');

                    tskList.add(tsk);
                }
                
                
            }
            Insert tskList;
            }
            
        

        
    

    
}
