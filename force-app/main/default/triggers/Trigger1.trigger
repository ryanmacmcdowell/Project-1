trigger Trigger1 on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    switch on trigger.operationType{
        when BEFORE_INSERT {

            AccountHandler.accountPhoneUpdater(trigger.new);

        }
        when BEFORE_UPDATE{

        }
        when BEFORE_DELETE{

        }
        when AFTER_INSERT{

            AccountHandler.addCVRangerAssignmentTask(trigger.new);

        }
        when AFTER_UPDATE{

        }
        when AFTER_DELETE{

        }
        when AFTER_UNDELETE{

        }
    }

}