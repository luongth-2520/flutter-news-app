import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/detail/article_detail.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, content, postUrl;

  const NewsTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.content,
    required this.postUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArticleDetail(
            postUrl: postUrl,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:
                  // Image.network(
                  //   imageUrl,
                  //   height: 180,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  CachedNetworkImage(
                height: 180,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                imageUrl: imageUrl,
                placeholder: (context, url) => const Icon(Icons.info),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              maxLines: 2,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              desc,
              maxLines: 2,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
