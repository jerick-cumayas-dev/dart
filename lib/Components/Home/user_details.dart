import 'package:flutter/material.dart';
import 'package:fitguide_main/State_Management/Providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitguide_main/Services/api/api.dart';

class UserDetailsWidget extends ConsumerWidget {
  const UserDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider);
    print(user);
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '${API.baseUrl}/${user.profilePicture}',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 30,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, ${user.firstName} ${user.lastName}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.008),
              Text(
                user.email,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
