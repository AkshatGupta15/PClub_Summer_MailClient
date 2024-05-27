
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pclub_summer_mailclient/model/data.dart';


Future<bool> sendMail({
  required String to,
  required String subject,
  required String body,
})async {
  // SMTP server details
  
  
  final username = dotenv.env["USERNAME"];
  final password = dotenv.env["PASSWORD"];
  // final storage = FlutterSecureStorage();
  // String? username = await storage.read(key: 'email');
  // String? password = await storage.read(key: 'password');
  print("username ${username}  password : PASSWORD dekha buri baat hoti hai");
   await dotenv.load(fileName: ".env");
  const smtpServer = 'mmtp.iitk.ac.in';
  const smtpPort = 25; // Use 465 if your server requires SSL from the start
  // Create an SMTP client
  var client = SmtpClient('enough.de',isLogEnabled: true);

  try {
    // Connect to the server
    await client.connectToServer(smtpServer, smtpPort, isSecure: false);
    await client.ehlo();

    // For port 587, start TLS after EHLO
    // if (smtpPort == 587) {
    //   await client.startTls();
    // }

    // Authenticate with the server
    await client.authenticate(username!, password!);

    // Build the email message
    final builder = MessageBuilder()
      ..from = [MailAddress(username.split('@')[0], username)]
      ..to = [MailAddress('Recipient Name', to)]
      ..subject = subject
      ..text = body;

    final mimeMessage = builder.buildMimeMessage();

    // Send the email
    await client.sendMessage(mimeMessage);

    print('Email sent successfully!');
    return true;
  } catch (e) {
    print('Failed to send email: $e');
    return false;
  } finally {
    await client.quit();
  }
}

Future<bool> Authenticate({
  required String email,
  required String password,
})async {
  
  // SMTP server details
  print("Username ${email} PAssword :  password dekhaga saale");
  await dotenv.load(fileName: ".env");
  const smtpServer = 'mmtp.iitk.ac.in';
  const smtpPort = 25; // Use 465 if your server requires SSL from the start
  // final username = dotenv.env["USERNAME"];
  // final password = dotenv.env["PASSWORD"]; 
  final username = email;
  // Create an SMTP client
  var client = SmtpClient('enough.de',isLogEnabled: true);

  try {
    // Connect to the server
    await client.connectToServer(smtpServer, smtpPort, isSecure: false);
    await client.ehlo();

    // For port 587, start TLS after EHLO
    // if (smtpPort == 587) {
    //   await client.startTls();
    // }

    // Authenticate with the server
    await client.authenticate(username, password);

    // Build the email message
    // final builder = MessageBuilder()
    //   ..from = [MailAddress(username.split('@')[0], username)]
    //   ..to = [MailAddress('Recipient Name', to)]
    //   ..subject = subject
    //   ..text = body;

    // final mimeMessage = builder.buildMimeMessage();

    // // Send the email
    // await client.sendMessage(mimeMessage);

    print('Logged in successfully!');
    return true;
  } catch (e) {
    print('Failed: $e');
    return false;
  } finally {
    await client.quit();
  }
}

Future<List<MimeMessage>> FetchMail() async {
  print('Fetching Mail');
  String imapServerHost = 'qasid.iitk.ac.in';
  int imapServerPort = 143;
bool isImapServerSecure = false;
  await dotenv.load(fileName: ".env");
  String? userName = dotenv.env["USERNAME"];
  String? password = dotenv.env["PASSWORD"];
  final client = ImapClient(isLogEnabled: true);
  print("connected to client");
  try {
    await client.connectToServer(imapServerHost, imapServerPort,
        isSecure: isImapServerSecure);
        print("connected to server");
    await client.login(userName!.split('@')[0], password!);

    print("logged in");
    final mailboxes = await client.listMailboxes();
    print('mailboxes: $mailboxes');
    await client.selectInbox();
    // fetch 10 most recent messages:
    final fetchResult = await client.fetchRecentMessages(
        messageCount: 1, criteria: 'BODY.PEEK[]');
    // final List<MailItem> MailList = [];
    // return fetchResult.messages;
    // for (final message in fetchResult.messages) {
      // printMessage(message);
    //   final mailItem = MailItem(title: "Fetched Mail" , description: message.decodeSubject()!, content: message.decodeTextPlainPart()!, time: message.decodeDate().toString(), isRead: message.isSeen);
    //   print(mailItem);
    //   MailList.add(mailItem);
    // }
    await client.logout();
    // print(MailList);
    return fetchResult.messages;
  } on ImapException catch (e) {
    print('IMAP failed with $e');
    return [];
  }
}
void printMessage(MimeMessage message) {
  print('from: ${message.from} with subject "${message.decodeSubject()}"');
  if (!message.isTextPlainMessage()) {
    print(' content-type: ${message.mediaType}');
  } else {
    final plainText = message.decodeTextPlainPart();
    if (plainText != null) {
      final lines = plainText.split('\r\n');
      for (final line in lines) {
        if (line.startsWith('>')) {
          // break when quoted text starts
          // break;
        }
        print(line);
      }
    }
  }
}