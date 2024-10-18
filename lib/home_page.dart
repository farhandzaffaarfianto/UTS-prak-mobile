import 'package:flutter/material.dart';
import 'models/destination_model.dart';
import 'destination_detail_page.dart';
import 'search_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    DestinationListPage(), // Halaman Home
    SearchPage(), // Halaman Search
    ProfilePage(), // Halaman Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIKETIN'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DestinationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = [
      Destination(
        name: 'Bali',
        location: 'Indonesia',
        imageUrl:
            'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/bali-nusa-tenggara/bali/denpasar/denpasar1.jpg',
        description:
            'Bali adalah pulau indah di Indonesia yang menawarkan pesona alam yang menakjubkan, mulai dari pantai yang memukau hingga kebudayaan yang kaya. '
            'Anda bisa menikmati keindahan pantai Kuta, berkunjung ke Pura Tanah Lot, atau merasakan suasana Ubud yang penuh dengan seni dan keheningan. '
            'Pulau ini juga terkenal dengan keramahan penduduk lokal, makanan khas, dan berbagai aktivitas menarik seperti surfing, snorkeling, hingga wisata kuliner. '
            'Bali adalah tempat yang sempurna untuk berlibur, baik bersama keluarga, pasangan, maupun teman-teman. '
            'Pesan tiket sekarang dan rasakan keajaiban Bali yang tiada duanya!',
      ),
      Destination(
        name: 'Paris',
        location: 'France',
        imageUrl:
            'https://www.bugbog.com/wp-content/uploads/2023/08/887087fa4833809f/best-places-like-france.jpeg',
        description:
            'Paris, ibu kota Prancis, adalah kota yang terkenal dengan keindahan, seni, dan romantisme. '
            'Menara Eiffel yang ikonik, Louvre yang legendaris, serta Katedral Notre-Dame yang memukau hanya beberapa dari banyak daya tarik yang menjadikan Paris tujuan wisata utama dunia. '
            'Anda bisa berjalan di sepanjang Champs-Élysées, menikmati suasana kafe klasik, atau mengeksplorasi galeri seni yang tiada habisnya. '
            'Paris juga merupakan pusat mode dan kuliner, di mana Anda bisa menikmati belanja di butik-butik ternama atau mencicipi hidangan lezat khas Prancis. '
            'Kota ini menawarkan pengalaman yang tak terlupakan bagi siapa pun yang berkunjung. '
            'Jangan lewatkan kesempatan untuk merasakan keajaiban Paris! Pesan tiket Anda sekarang dan mulailah petualangan ke kota cinta ini!',
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured Destinations Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Destinations',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),

          // Featured Destination Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      'https://ikpi.or.id/wp-content/uploads/2023/07/bali.jpg',
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Discover Bali',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Explore the beauty of Bali, Indonesia...',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Chip(
                  label: Text('Beach'),
                  backgroundColor: Colors.blue[100],
                ),
                Chip(
                  label: Text('Mountain'),
                  backgroundColor: Colors.green[100],
                ),
                Chip(
                  label: Text('City'),
                  backgroundColor: Colors.orange[100],
                ),
                Chip(
                  label: Text('Nature'),
                  backgroundColor: Colors.teal[100],
                ),
              ],
            ),
          ),

          SizedBox(height: 20.0),

          // List of Destinations
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  destinations[index].imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(destinations[index].name),
                subtitle: Text(destinations[index].location),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestinationDetailPage(
                          destination: destinations[index]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
