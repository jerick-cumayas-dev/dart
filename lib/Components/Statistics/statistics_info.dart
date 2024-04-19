import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitguide_main/Services/api/api.dart';
import 'package:fitguide_main/State_Management/Providers/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StatisticsUserInfo extends StatelessWidget {
  const StatisticsUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final user = ref.watch(userStateProvider);
      return Column(children: [
        // CachedNetworkImage(
        //   imageUrl: 'https://$url${user.profilePicture}',
        //   imageBuilder: (context, imageProvider) => CircleAvatar(
        //     radius: 30,
        //     backgroundImage: imageProvider,
        //   ),
        //   placeholder: (context, url) => const CircularProgressIndicator(),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),

        Center(
          child: CachedNetworkImage(
            imageUrl: '${API.baseUrl}/${user.profilePicture}',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.17,
              backgroundImage: imageProvider,
            ),
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),

        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Text(
          "${user.firstName} ${user.lastName}",
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5, // Set to your desired letter spacing
            // Add any additional styling properties as needed
          ),
        ),
        Text(
          user.email,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.035,
            letterSpacing: 1.5, // Set to your desired letter spacing
            // Add any additional styling properties as needed
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
      ]);
    });
  }
}
