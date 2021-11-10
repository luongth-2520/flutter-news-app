import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/models/theme_type.dart';
import 'package:news_app/data/providers/news_provider.dart';
import 'package:news_app/data/providers/theme_provider.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final newsProvider = Provider.of<NewsProvider>(context);
    final newsData = newsProvider.news;

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(theme),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Latest News Headlines',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              if (newsProvider.error.isNotEmpty)
                Text(newsProvider.error)
              else if (newsData.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: newsData.length,
                  itemBuilder: (context, index) => FadeIn(
                    child: NewsTile(
                      imageUrl: newsData[index].urlToImage,
                      title: newsData[index].title,
                      desc: newsData[index].description,
                      content: newsData[index].content,
                      postUrl: newsData[index].articleUrl,
                    ),
                  ),
                )
              else
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            shimmerWidget(
                                200, MediaQuery.of(context).size.width),
                            const SizedBox(height: 8),
                            shimmerLine(MediaQuery.of(context).size.width),
                            const SizedBox(height: 10),
                            shimmerLine(MediaQuery.of(context).size.width * 0.5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(ThemeProvider theme) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info),
        ),
        const Spacer(),
        Center(
          child: Text(
            'Trends',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => theme.switchTheme(),
          icon: theme.myTheme == ThemeType.light
              ? const Icon(Icons.wb_sunny)
              : const Icon(FontAwesomeIcons.solidMoon),
        ),
      ],
    );
  }
}
