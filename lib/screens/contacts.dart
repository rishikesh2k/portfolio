import 'package:animate_do/animate_do.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  List<Contact> _contacts = [ Contact(displayName: 'Rishikesh yadav',emails: [Item(value: 'rishikeshyadav2k@gmail.com')],phones: [Item(value: '+91-8433315701')] )];

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }
  final String linkedInUrl = 'https://www.linkedin.com/in/rishikesh-yadav-06916b1ba';

  // Function to launch the LinkedIn URL
  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse(linkedInUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _fetchContacts() async {
    // Request permission to access contacts
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
  }

  void _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  void _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void _launchWhatsApp(String phone) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phone,
    );
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded,color : Colors.white,)),
        backgroundColor: Colors.teal,
        title: Text('Contacts',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
        
      ),
      body: Stack(

        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal,
                  Colors.white,
                  Colors.white,
                
                  
                ],
              ),
            ),
          ),
          Column(
            children: [
               SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    return Card(
                      color: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(contact.displayName ?? 'No Name',style: TextStyle(color: Colors.teal,fontSize: 16,fontWeight: FontWeight.bold),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (contact.emails != null && contact.emails!.isNotEmpty)
                              Text('Email: ${contact.emails!.first.value}',style: TextStyle(color: Colors.black54)),
                            if (contact.phones != null && contact.phones!.isNotEmpty)
                              Text('Phone: ${contact.phones!.first.value}, +91-8591262165',style: TextStyle(color: Colors.black54),),
                               SlideInLeft(
                                 child: Row(
                                                             mainAxisAlignment: MainAxisAlignment.end,
                                                             children: [
                                                               if (contact.emails != null && contact.emails!.isNotEmpty)
                                                                 IconButton(
                                  icon: Icon(AntDesign.mail_fill,color: Colors.redAccent,),
                                  onPressed: () => _launchEmail(contact.emails!.first.value!),
                                                                 ),
                                                               if (contact.phones != null && contact.phones!.isNotEmpty)
                                                                 IconButton(
                                  icon: Icon(AntDesign.phone_fill,color: Colors.green,),
                                  onPressed: () => _launchPhone(contact.phones!.first.value!),
                                                                 ),
                                                               if (contact.phones != null && contact.phones!.isNotEmpty)
                                                                 IconButton(
                                  icon: Icon(AntDesign.whats_app_outline,color: Colors.greenAccent,),
                                  onPressed: () => _launchWhatsApp("+91-8591262165"),
                                                                 ),
                                                                 IconButton(onPressed:  _launchLinkedIn, icon: Icon(AntDesign.linkedin_fill,color: Colors.blue,),)
                                                             
                                                             ],
                                                           ),
                               ),
                          ],
                        ),
                      
                      ),
                    );
                    
                  },
                ),
              ),
              
               
            ],
          ),
        ],
      ),
    );
  }
}