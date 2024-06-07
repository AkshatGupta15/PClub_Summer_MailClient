import 'package:enough_mail/enough_mail.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<bool> Authenticate({
  required String email,
  required String password,
})async {
  print("Username ${email} PAssword :  password dekhaga saale");
  await dotenv.load(fileName: ".env");
  const smtpServer = 'mmtp.iitk.ac.in';
  const smtpPort = 25;
  final username = email;
  var client = SmtpClient('mail-client',isLogEnabled: true);

  try {
    await client.connectToServer(smtpServer, smtpPort, isSecure: false);
    await client.ehlo();
    await client.authenticate(username, password);
    // if  (username =="Ak@gmail.com" && password == "1234"){
    //   return true;
    // } else {
    //   return false;
    // }
    print('Logged in successfully!');
    return true;
  } catch (e) {
    print('Failed: $e');
    return false;
  } finally {
    await client.quit();
  }
}
