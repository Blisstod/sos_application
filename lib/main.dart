import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SOSPage(),
    );
  }
}

class SOSPage extends StatelessWidget {
  void _launchPhone() async {
    const url = 'tel:102'; // Replace 911 with the emergency number you prefer
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon:
                      Icon(Icons.home, size: 50.0, color: Colors.pink.shade300),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.location_on,
                      size: 50.0, color: Colors.pink.shade300),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationPage()),
                    );
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.phone,
                //       size: 50.0, color: Colors.pink.shade300),
                //   onPressed: _launchPhone,
                // ),
                IconButton(
                  icon:
                      Icon(Icons.info, size: 50.0, color: Colors.pink.shade300),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Safety, Our Priority',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.pink.shade200,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: _launchPhone,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade300, Colors.pink.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.shade400,
                      offset: Offset(0, 4),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                width: 200.0,
                height: 200.0,
                child: Center(
                  child: Text(
                    'SOS',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Or need volunteer help instead?',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.pink.shade300,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Offline',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('Finding the nearest volunteer...'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pink.shade300),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: FlutterMap(
            options: MapOptions(
              center:
                  LatLng(51.1194, 71.4091), // Astana, Kazakhstan coordinates
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 70.0,
                    height: 70.0,
                    point: LatLng(51.1030, 71.4060),
                    builder: (ctx) => Container(
                      child: Icon(Icons.person_pin_circle,
                          color: Colors.pink.shade300, size: 40.0),
                    ),
                  ),
                  Marker(
                    width: 70.0,
                    height: 70.0,
                    point: LatLng(51.110, 71.4265),
                    builder: (ctx) => Container(
                      child: Icon(Icons.person_pin_circle,
                          color: Colors.pink.shade300, size: 40.0),
                    ),
                  ),
                  Marker(
                    width: 70.0,
                    height: 70.0,
                    point: LatLng(51.0945, 71.4272),
                    builder: (ctx) => Container(
                      child: Icon(Icons.person_pin_circle,
                          color: Colors.pink.shade300, size: 40.0),
                    ),
                  ),
                  Marker(
                    width: 90.0,
                    height: 90.0,
                    point: LatLng(51.0980, 71.4080),
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_pin,
                          color: Colors.pink.shade300, size: 50.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('Personal Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Personal data'),
            _buildInfoRow('Name', 'Nazerke'),
            _buildInfoRow('Username', 'nazkaz11'),
            _buildInfoRow('Email', 'nab423198@gmail.com'),
            _buildInfoRow('Birthday', 'September 28, 2009'),
            SizedBox(height: 20),
            _buildSectionTitle('Security'),
            _buildSecurityOption('Change password'),
            _buildSecurityOption('Two-factor authentication'),
            SizedBox(height: 20),
            _buildSectionTitle('Contact us'),
            _buildContactInfo('WhatsApp', '+7 775 275 4934'),
            _buildContactInfo('Phone call', '+7 707 646 1388'),
            _buildContactInfo('Email', 'nab423198@gmail.com'),
            _buildContactInfo('Email', 'kuralay.nazyr@gmail.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.pink.shade200,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityOption(String option) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        option,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContactInfo(String type, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            info,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final List<String> volunteers = ['John', 'Kuralay', 'Nazerke'];
  String _selectedVolunteer = 'John';

  void _sendMessage() {
    if (_controller.text.isEmpty) return;
    setState(() {
      _messages.add({'message': _controller.text, 'isVolunteer': false});
      _controller.clear();
    });
  }

  Widget _buildChatBubble(String message, bool isVolunteer) {
    return Align(
      alignment: isVolunteer ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isVolunteer ? Colors.pink.shade200 : Colors.pink.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('Chat with Volunteer'),
        actions: [
          DropdownButton<String>(
            dropdownColor: Colors.pink.shade100,
            value: _selectedVolunteer,
            items: volunteers.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedVolunteer = newValue!;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildChatBubble(_messages[index]['message'],
                    _messages[index]['isVolunteer']);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink.shade300),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
