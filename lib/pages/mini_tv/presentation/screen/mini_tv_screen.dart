import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:stove_genie/pages/mini_tv/presentation/screen/youtuve_player_screen.dart';
import 'package:stove_genie/utils/colors.dart';

class MiniTvScreen extends StatefulWidget {
  const MiniTvScreen({super.key});

  @override
  State<MiniTvScreen> createState() => _MiniTvScreenState();
}

class _MiniTvScreenState extends State<MiniTvScreen>
    with TickerProviderStateMixin {
  final String apiKey = 'AIzaSyD4FlR-bxLe4cPsXZJO0NlhOD6hDlOCnj8';
  bool useMockData = true;

  final List<Map<String, String>> foodChannels = [
    {'id': 'UCqFzWxSCi39LnW1JKFR3efg', 'name': 'Tasty'},
    {'id': 'UCbpMy0Fg74eXXkvxJrtEn3w', 'name': 'Bon Appétit'},
    {'id': 'UCRIYplQFdur_mHLBJIDwZww', 'name': 'Food Network'},
    {'id': 'UCekQr9znsk2vWxBo3YiLq2w', 'name': 'Binging with Babish'},
    {'id': 'UCsaGKqPZnGp_7N80hcHySGQ', 'name': 'Maangchi'},
    {'id': 'UCVVAnxQ2YMC_qlc7QfPA2YQ', 'name': 'Brothers Green Eats'},
  ];

  List<Map<String, dynamic>> channels = [];
  List<Map<String, dynamic>> videos = [];
  bool isLoading = true;
  bool showVideos = false;
  String selectedChannelName = '';

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    fetchChannelData();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> fetchChannelData() async {
    if (apiKey == 'YOUR_YOUTUBE_API_KEY_HERE' || useMockData) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        channels = _getMockChannelData();
        isLoading = false;
      });
      _fadeController.forward();
      return;
    }
    // Rest of your API logic here...
  }

  Future<void> fetchChannelVideos(String channelId, String channelName) async {
    setState(() {
      isLoading = true;
      showVideos = true;
      selectedChannelName = channelName;
    });

    if (apiKey == 'YOUR_YOUTUBE_API_KEY_HERE' || useMockData) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        videos = _getMockVideoDataForChannel(channelId);
        isLoading = false;
      });
      _slideController.forward();
      return;
    }
  }

  String _formatCount(String count) {
    int number = int.tryParse(count) ?? 0;
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
// inside your _MiniTvScreenState:

  /// no change to your channel data
  List<Map<String, dynamic>> _getMockChannelData() {
    return [
      {
        'id': 'UCJFp8uSYCjXOMnkUyb3CQ3Q', // Tasty
        'title': 'Tasty',
        'thumbnail': 'https://picsum.photos/200/200?random=1',
        'subscribers': '21.2M',
        'videos': '4500',
        'views': '12.5B',
        'description': 'Food videos that make cooking fun and accessible.',
      },
      {
        'id': 'UCbpMy0Fg74eXXkvxJrtEn3w', // Bon Appétit
        'title': 'Bon Appétit',
        'thumbnail': 'https://picsum.photos/200/200?random=2',
        'subscribers': '6.1M',
        'videos': '3200',
        'views': '1.8B',
        'description': 'Cooking videos from the Bon Appétit test kitchen.',
      },
      {
        'id': 'UCRIYplQFdur_mHLBJIDwZww', // Food Network
        'title': 'Food Network',
        'thumbnail': 'https://picsum.photos/200/200?random=3',
        'subscribers': '9.2M',
        'videos': '15000',
        'views': '7.3B',
        'description':
            'Official Food Network channel with recipes and cooking shows.',
      },
      {
        'id': 'UCekQr9znsk2vWxBo3YiLq2w', // Binging with Babish
        'title': 'Binging with Babish',
        'thumbnail': 'https://picsum.photos/200/200?random=4',
        'subscribers': '10.1M',
        'videos': '800',
        'views': '2.1B',
        'description': 'Recreating foods from movies, TV shows, and more.',
      },
      {
        'id': 'UC8fDlq1wKJWs4zCzY9Dr9QA', // Maangchi
        'title': 'Maangchi',
        'thumbnail': 'https://picsum.photos/200/200?random=5',
        'subscribers': '6.5M',
        'videos': '500',
        'views': '890M',
        'description': 'Authentic Korean cooking recipes and techniques.',
      },
      {
        'id': 'UCVVAnxQ2YMC_qlc7QfPA2YQ', // Brothers Green Eats
        'title': 'Brothers Green Eats',
        'thumbnail': 'https://picsum.photos/200/200?random=6',
        'subscribers': '1.2M',
        'videos': '300',
        'views': '150M',
        'description': 'Creative cooking and food hacks.',
      },
    ];
  }

  /// channel-aware mock videos
  List<Map<String, dynamic>> _getMockVideoDataForChannel(String channelId) {
    switch (channelId) {
      case 'UCJFp8uSYCjXOMnkUyb3CQ3Q': // Tasty
        return [
          {
            'videoId': 'icr2j-IF5Zw',
            'title': 'Tasty’s Classic 4 Meals Anyone Can Make Tonight',
            'thumbnail': 'https://i.ytimg.com/vi/icr2j-IF5Zw/hqdefault.jpg',
            'channelTitle': 'Tasty',
            'publishedAt': '2024-09-10T12:00:00Z',
            'description':
                'Try these 4 quick meal recipes that anyone can make.',
          },
          {
            'videoId': 'pQPxPjUvBJQ',
            'title': 'Tasty 101: Mastering Breakfast',
            'thumbnail': 'https://i.ytimg.com/vi/pQPxPjUvBJQ/hqdefault.jpg',
            'channelTitle': 'Tasty',
            'publishedAt': '2024-08-05T08:30:00Z',
            'description':
                'Everything you need to know to make perfect eggs, pancakes, and more.',
          },
          {
            'videoId': '9_5wHw6l11o',
            'title': '7 Recipes You Can Make In 5 Minutes',
            'thumbnail': 'https://i.ytimg.com/vi/9_5wHw6l11o/hqdefault.jpg',
            'channelTitle': 'Tasty',
            'publishedAt': '2024-07-22T14:15:00Z',
            'description':
                'Super-fast, delicious recipes for your busiest days.',
          },
        ];

      case 'UCbpMy0Fg74eXXkvxJrtEn3w': // Bon Appétit
        return [
          {
            'videoId': 'iYMcvGktqhU',
            'title': 'Recreating Maangchi’s Seafood Kimchi Fried Rice',
            'thumbnail': 'https://i.ytimg.com/vi/iYMcvGktqhU/hqdefault.jpg',
            'channelTitle': 'Bon Appétit',
            'publishedAt': '2024-06-30T16:00:00Z',
            'description': 'We try Maangchi’s viral seafood fried rice recipe.',
          },
          {
            'videoId': '3M_BW_6PX54',
            'title': 'Pro Chef Tries Pancake Art for the First Time',
            'thumbnail': 'https://i.ytimg.com/vi/3M_BW_6PX54/hqdefault.jpg',
            'channelTitle': 'Bon Appétit',
            'publishedAt': '2024-05-18T10:45:00Z',
            'description':
                'Chef Chris O’Donnell attempts pancake art challenges.',
          },
        ];

      case 'UCRIYplQFdur_mHLBJIDwZww': // Food Network
        return [
          {
            'videoId': 'Jga_QNfQHw0',
            'title': 'Chopped: Huckleberries, Black Beans, Octopus',
            'thumbnail': 'https://i.ytimg.com/vi/Jga_QNfQHw0/hqdefault.jpg',
            'channelTitle': 'Food Network',
            'publishedAt': '2024-08-12T18:00:00Z',
            'description': 'Highlights from our latest Chopped episode.',
          },
          {
            'videoId': '7ueGDhuWvbU',
            'title': 'Top Tomato Recipe Videos',
            'thumbnail': 'https://i.ytimg.com/vi/7ueGDhuWvbU/hqdefault.jpg',
            'channelTitle': 'Food Network',
            'publishedAt': '2024-07-25T09:30:00Z',
            'description':
                'Our favorite tomato dishes straight from Food Network chefs.',
          },
        ];

      case 'UCekQr9znsk2vWxBo3YiLq2w': // Binging with Babish
        return [
          {
            'videoId': '5inVS8RSz7Q',
            'title': 'Ranking Your STRANGEST Recipes',
            'thumbnail': 'https://i.ytimg.com/vi/5inVS8RSz7Q/hqdefault.jpg',
            'channelTitle': 'Binging with Babish',
            'publishedAt': '2024-06-15T12:20:00Z',
            'description': 'I taste and rank some of your strangest requests.',
          },
          {
            'videoId': 'lz7dl6vq9NU',
            'title': 'Disney Movie Food Marathon',
            'thumbnail': 'https://i.ytimg.com/vi/lz7dl6vq9NU/hqdefault.jpg',
            'channelTitle': 'Binging with Babish',
            'publishedAt': '2024-05-02T14:00:00Z',
            'description': 'Cooking foods inspired by classic Disney movies.',
          },
        ];

      case 'UC8fDlq1wKJWs4zCzY9Dr9QA': // Maangchi
        return [
          {
            'videoId': 'eTucCw1w6Ak',
            'title': 'Traditional Tongbaechu‐Kimchi Recipe',
            'thumbnail': 'https://i.ytimg.com/vi/eTucCw1w6Ak/hqdefault.jpg',
            'channelTitle': 'Maangchi',
            'publishedAt': '2024-04-10T11:00:00Z',
            'description': 'Step‐by‐step kimchi making at home.',
          },
          {
            'videoId': 'Y-Td1-dJQ-c',
            'title': 'Kimchi Made with Love',
            'thumbnail': 'https://i.ytimg.com/vi/Y-Td1-dJQ-c/hqdefault.jpg',
            'channelTitle': 'Maangchi',
            'publishedAt': '2024-03-22T15:30:00Z',
            'description': 'Stories from the kitchen while we make kimchi.',
          },
        ];

      case 'UCVVAnxQ2YMC_qlc7QfPA2YQ': // Brothers Green Eats
        return [
          {
            'videoId': 'F85TTMCdIj0',
            'title': 'Food Hack: Garlic Sauce',
            'thumbnail': 'https://i.ytimg.com/vi/F85TTMCdIj0/hqdefault.jpg',
            'channelTitle': 'Brothers Green Eats',
            'publishedAt': '2024-02-14T13:45:00Z',
            'description': 'A 3‐ingredient garlic sauce hack you need to try.',
          },
          {
            'videoId': 'y8iQL18X8Tc',
            'title': '5-Ingredient Stoner Snacks',
            'thumbnail': 'https://i.ytimg.com/vi/y8iQL18X8Tc/hqdefault.jpg',
            'channelTitle': 'Brothers Green Eats',
            'publishedAt': '2024-01-30T17:10:00Z',
            'description': 'Cheap, easy, and ridiculous snack ideas.',
          },
        ];

      default:
        return [];
    }
  }

  String _formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    Duration difference = DateTime.now().difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF8F9FA),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTVHeader(),
              Expanded(
                child: isLoading ? _buildLoadingScreen() : _buildMainContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTVHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border(
          bottom: BorderSide(
            color: AppColors.buttonColor.withValues(alpha: 0.2),
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.buttonColor.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.live_tv, color: Colors.white, size: 16),
                const SizedBox(width: 5),
                Text(
                  'LIVE',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Text(
            showVideos ? selectedChannelName : 'Food Channels',
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3748),
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          if (showVideos)
            GestureDetector(
              onTap: () {
                _slideController.reverse().then((_) {
                  setState(() {
                    showVideos = false;
                    videos.clear();
                    selectedChannelName = '';
                  });
                  _fadeController.forward();
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF4A5568),
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.buttonColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.buttonColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Loading Content...',
            style: GoogleFonts.poppins(
              color: const Color(0xFF4A5568),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return showVideos ? _buildVideosList() : _buildChannelsList();
  }

  Widget _buildChannelsList() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: channels.length,
        itemBuilder: (context, index) {
          final channel = channels[index];
          return GestureDetector(
            onTap: () {
              _fadeController.reverse().then((_) {
                fetchChannelVideos(channel['id'], channel['title']);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              channel['thumbnail'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: const Color(0xFFF7FAFC),
                                  child: const Icon(
                                    Icons.tv,
                                    color: Color(0xFF9CA3AF),
                                    size: 50,
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF10B981),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Live',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF374151),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
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
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            channel['title'],
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF1A202C),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.people_outline,
                                color: AppColors.buttonColor,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${channel['subscribers']} subscribers',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF718096),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.video_library_outlined,
                                color: AppColors.buttonColor,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${channel['videos']} videos',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF718096),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildVideosList() {
    return SlideTransition(
      position: _slideAnimation,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(
                color: Colors.grey.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        video['thumbnail'],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: const Color(0xFFF7FAFC),
                            child: const Center(
                              child: Icon(
                                Icons.video_library_outlined,
                                color: Color(0xFF9CA3AF),
                                size: 50,
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              final id = video['videoId'] as String;
                              final fullUrl =
                                  'https://www.youtube.com/watch?v=$id';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => YoutubeVideoPlayerScreen(
                                    videoUrl: fullUrl,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.play_arrow,
                                color: AppColors.buttonColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _formatDate(video['publishedAt']),
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF4A5568),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video['title'],
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1A202C),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            video['channelTitle'],
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF4A5568),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        video['description'],
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF718096),
                          fontSize: 13,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
