public class LeadHandler {

    public static void checkForAccountMatches(List<Lead> leadList){

        List<Account> acctsList = [SELECT Name FROM Account LIMIT 50];
        List<Contact> contList = new List<Contact>();

        for(Lead currLead : leadList){

            String leadCompnay = currLead.Company;

            for(Account currAcc : acctsList){

                String accName = currAcc.Name;

                if(leadCompnay == accName){
                    currLead.LeadSource = currAcc.Name;
                    currLead.Status = 'Converted';
                    currLead.Description = 'Attatched to already existing Account - Contact Added';
                    
                    Contact cont = new Contact();
                    cont.FirstName = currLead.FirstName;
                    cont.LastName = currLead.LastName;
                    cont.Phone = currLead.Phone;
                    cont.Email = currLead.Email;
                    cont.LeadSource = currLead.LeadSource;
                    cont.Title = currLead.Title;
                    cont.AccountId = currAcc.Id;
                    cont.Salutation = currLead.Salutation;

                    contList.add(cont);

                }
            }

        insert contList;
        }

      

    }

    public static void createNewTaskFromLead(List<Lead> leadList){

        List<Task> tskList = new List<Task>();

        for(Lead currLead : leadList){
            Task tsk = new Task();
            tsk.Status = 'Not Started';
            tsk.Priority = 'Normal';
            tsk.Subject = (currLead.FirstName +' '+ currLead.LastName + ' has requested a call from the Experience Page!');

            tskList.add(tsk);
        }

             insert tskList;
        }
    
}
