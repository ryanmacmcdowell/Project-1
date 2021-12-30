@isTest
public class TestHelper {

        public static void InsertAccounts(Integer numAccounts) {
            List<Account> toInsert = new List<Account>();
            
            for(Integer num = 0; num < numAccounts; num++) {
                toInsert.add(new Account(name = 'Test Account ' + num));
            }

            Insert toInsert;

    }

    public static List<Account> CreateAccounts(Integer numAccounts) {
        List<Account> toReturn = new List<Account>();
        List<Account> toReturn2 = new List<Account>();
        
        for(Integer num = 0; num < numAccounts; num++) {
            toReturn2.add(new Account(name = 'Bad Acc ' + num, State__c='MA'));
        }
        
        return toReturn2;
    }
    public static List<Account> CreateAccountsCavalcade(Integer numAccounts) {
        List<Account> toReturn = new List<Account>();
        
        for(Integer num = 0; num < numAccounts; num++) {
            toReturn.add(new Account(name = 'Acc ' + num, State__c='MA', Description = 'Cavalcade'));
        }
        
        return toReturn;
    }

    public static List<Lead> CreateMatchingLeads(Integer numLeads){
        List<Lead> returnLeads = new List<Lead>();
        for(Integer num ; num<numLeads; num++){
            returnLeads.add(new Lead(LastName = 'matching lead' + num, Company='Fulton Council'));
        }
        return returnLeads;
    }

    public static List<Lead> CreateUnmatchingLeads(Integer numLeads){
        List<Lead> returnLeads = new List<Lead>();
        for(Integer num ; num<numLeads; num++){
            returnLeads.add(new Lead(LastName = 'matching lead' + num, Company='ABCDEFU'));
        }
        return returnLeads;
    }
}
