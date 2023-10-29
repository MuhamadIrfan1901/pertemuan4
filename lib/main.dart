import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioApp(),
    );
  }
}

class PortfolioApp extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text('My Portfolio',style: TextStyle(color: Colors.black),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeTab(),
          ProjectsTab(),
          ContactTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue[50],
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.pinkAccent.withOpacity(0.8),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Data Diri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_history),
            label: 'Riwayat Pekerjaan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assured_workload),
            label: 'Data Pendidikan',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('images/pic.png'),
          ),
          SizedBox(height: 20),
          Text(
            'Muhamad Irfan Aldiansyah',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('Teknik Informatika'),
          SizedBox(height: 15),
          _buildDataRow('Age', '22'),
          _buildDataRow('Location', 'Tangerang, Banten'),
          _buildDataRow('Email', 'fanaldian07@gmail.com'),
          _buildDataRow('Contact', '+6282111729907'),
        ],
      ),
    );
  }
}
Widget _buildDataRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 9.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label + ': ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    ),
  );
}


class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('Riwayat Pekerjaan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDataRow('Nama ', 'Muhamad Irfan Aldiansyah'),
          _buildDataRow('~ Tempat Tanggal Lahit', 'Tangerang, 10-07-2001'),
          _buildDataRow('~ Jabatan', 'Dokumen KUR'),
          _buildDataRow('~ Pendidikan', '- SD Berijazah 2013'),
          _buildDataRow('', '- SMP Berijazah 2016'),
          _buildDataRow('', '- SMA Berijazah 2019'),
        ],
      ),
    );
  }
}

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Text('Data Pendidikan',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          _buildDataRow('Formal ', ''),
          _buildDataRow('~ 2006 - 2009', 'TK Nurhidayah, Kab.Tangerang'),
          _buildDataRow('~ 2009 - 2013', 'SDN Balaraja, Kab.Tangerang'),
          _buildDataRow('~ 2013 - 2016', 'SMPN 1 Balaraja, Kab.Tangerang'),
          _buildDataRow('~ 2016 - 2019', 'SMA Mandiri Balaraja, Kab.Tangerang'),
          SizedBox(height: 20),
          _buildDataRow('Non-Formal ', ''),
          _buildDataRow('2018 - 2019 ', 'Menjadi Sekretaris OSIS'),
        ],
      ),
    );
  }
}