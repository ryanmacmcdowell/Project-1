@isTest

public class LeadTriggerTests{

@isTest
public static void PN_Single_LeadTrigger_Test(){

    Test.startTest();

    List<Lead> posLeadsCount = new List<Lead>();

    List<Lead> posLeads = TestHelper.CreateMatchingLeads(1);

    for(Lead currLead : posLeads){
        if (currLead.Status=='Converted') {
            posLeadsCount.add(currLead);
        }
        System.assertEquals(1, posLeadsCount.size());
    }

    List<Lead> negLeadsCount= new List<Lead>();

    List<Lead> negLeads = TestHelper.CreateMatchingLeads(1);

    for(Lead currLead : negLeads){
        if (currLead.Status=='Converted') {
            negLeadsCount.add(currLead);
        }
        System.assertEquals(0, negLeadsCount.size());
    }

    Test.stopTest();
}

@isTest
public static void PN_Bulk_LeadTrigger_Test(){

    Test.startTest();

    List<Lead> posLeadsCount = new List<Lead>();

    List<Lead> posLeads = TestHelper.CreateMatchingLeads(50);

    for(Lead currLead : posLeads){
        if (currLead.Status=='Converted') {
            posLeadsCount.add(currLead);
        }
        System.assertEquals(50, posLeadsCount.size());
    }

    List<Lead> negLeadsCount= new List<Lead>();

    List<Lead> negLeads = TestHelper.CreateMatchingLeads(50);

    for(Lead currLead : negLeads){
        if (currLead.Status=='Converted') {
            negLeadsCount.add(currLead);
        }
        System.assertEquals(0, negLeadsCount.size());
    }

    Test.stopTest();

    
}
@isTest
public static void PN_Single_LeadTriggerContactCreated_Test(){

    Test.startTest();

    List<Lead> posLeadsCount = new List<Lead>();

    List<Lead> posLeads = TestHelper.CreateMatchingLeads(1);

    for(Lead currLead : posLeads){
        List<Contact> currCont= [SELECT Name FROM Contact WHERE Name=:currLead.Name];
        if (currCont.size() > 0) {
            posLeadsCount.add(currLead);
        }
        System.assertEquals(1, posLeadsCount.size());
    }

    List<Lead> negLeadsCount= new List<Lead>();

    List<Lead> negLeads = TestHelper.CreateMatchingLeads(1);

    for(Lead currLead : posLeads){
        List<Contact> currCont= [SELECT Name FROM Contact WHERE Name=:currLead.Name];
        if (currCont.size() > 0) {
            negLeadsCount.add(currLead);
        }
        System.assertEquals(0, negLeadsCount.size());
    }

    Test.stopTest();
}

@isTest
public static void PN_Bulk_LeadTriggerContactCreated_Test(){

    Test.startTest();

    List<Lead> posLeadsCount = new List<Lead>();

    List<Lead> posLeads = TestHelper.CreateMatchingLeads(50);

    for(Lead currLead : posLeads){
        List<Contact> currCont= [SELECT Name FROM Contact WHERE Name=:currLead.Name];
        if (currCont.size() > 0) {
            posLeadsCount.add(currLead);
        }
        System.assertEquals(50, posLeadsCount.size());
    }

    List<Lead> negLeadsCount= new List<Lead>();

    List<Lead> negLeads = TestHelper.CreateMatchingLeads(50);

    for(Lead currLead : posLeads){
        List<Contact> currCont= [SELECT Name FROM Contact WHERE Name=:currLead.Name];
        if (currCont.size() > 0) {
            negLeadsCount.add(currLead);
        }
        System.assertEquals(0, negLeadsCount.size());
    }

    Test.stopTest();

    
}
}
