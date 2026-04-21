import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/utils/app_colors.dart';

class DetailPage extends StatelessWidget {
  final Article article = Get.arguments as Article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: article.urlToImage != null
              ? CachedNetworkImage(imageUrl: article.urlToImage!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: AppColors.divider,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.divider,
                child: Icon(Icons.broken_image,
                color: AppColors.textHint,
                ),
              ),
              )
              : Container(
                color: AppColors.divider,
                child: Icon(
                  Icons.broken_image,
                  color: AppColors.textHint,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}