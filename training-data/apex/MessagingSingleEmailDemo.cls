public class MessagingSingleEmailDemo {
    // Builds a SingleEmailMessage; sending is guarded because
    // test context does not deliver real mail.
    public static Messaging.SingleEmailMessage buildMessage(
        String toAddress, String subject, String body
    ) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new List<String>{ toAddress });
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setSaveAsActivity(false);
        return mail;
    }

    public static void run() {
        Messaging.SingleEmailMessage mail =
            buildMessage('user@example.com', 'Weekly digest', 'Hello from Apex');
        System.debug('Subject: ' + mail.getSubject());
        System.debug('Recipients: ' + mail.getToAddresses());

        if (!Test.isRunningTest()) {
            List<Messaging.SendEmailResult> results =
                Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
            System.debug('Success: ' + results[0].isSuccess());
        }
        // Daily limit check
        System.debug('Email invocations used: ' + Limits.getEmailInvocations());
    }
}
