@isTest

public class TriggerTest {

    /*@TestSetup
    static void makeData(){
        List<Account> accountsToInsert = new List<Account>();
        for(Integer num = 0; num < 151; num++) {
            accountsToInsert.add(new Account(name = 'Test Account ' + num));
        }

        Insert accountsToInsert;
        
    } */
    @isTest
    public static void Pos_Trigger1_Desc() {

        Test.startTest();

        List<Account> testAcc = TestHelper.CreateAccountsCavalcade(1);
        AccountHandler.accountDescriptionUpdater(testAcc);


        System.assertEquals('Cavalcade - CV Ranger assignments needed', testAcc[0].Description);

        Test.stopTest();
    }

    @isTest
    public static void PN_Trigger1_Task(){
        Test.startTest();
        List<Account> newAccList = TestHelper.CreateAccountsCavalcade(1);
        Insert newAccList;
        String accName = newAccList[0].Name + ' needs a new Cavalcade Ranger Assignment!';
        List<Task> tskList = [SELECT Subject FROM Task WHERE Subject = :accName];
        System.assertEquals(1, tskList.size());

        List<Account> newAccList2 = TestHelper.CreateAccounts(1);
        Insert newAccList2;
        String accName2 = newAccList2[0].Name + ' needs a new Cavalcade Ranger Assignment!';
        List<Task> tskList2 = [SELECT Subject FROM Task WHERE Subject = :accName2];
        System.assertEquals(0, tskList2.size());

        


        Test.stopTest();  

        }

             
    



    @isTest 
    public static void PNBulk_Trigger1_Task(){
        Test.startTest();
        List<Account> newAccList = TestHelper.CreateAccountsCavalcade(50);
        Insert newAccList;
        List<Task> tskList = new List<Task>();
        
        for(Account acc: newAccList){
            String tskDesc = acc.Name+' needs a new Cavalcade Ranger Assignment!';
            Task currTsk = [SELECT Subject FROM Task WHERE Subject=:tskDesc];
            tskList.add(currTsk);
        }

        System.assertEquals(50, tskList.size());
    
        List<Account> badAccList = TestHelper.CreateAccounts(50);
        List<Task> tskList2 = new List<Task>();
        for(Account acc: badAccList){
            String tskDesc = acc.Name+' needs a new Cavalcade Ranger Assignment!';
            List<Task> currTskList = [SELECT Subject FROM Task WHERE Subject=:tskDesc];
            if (currTskList.size() > 0){
                Task currTsk = currTskList[0];
                tskList2.add(currTsk);
            }else{
                continue;
            }
            System.assertEquals(0, currTskList.size());
        }

        

        Test.stopTest();
    }
}
