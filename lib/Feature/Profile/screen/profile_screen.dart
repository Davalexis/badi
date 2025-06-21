import 'package:badi/Core/constants/Colors.dart';
import 'package:badi/Feature/Profile/widget/profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //----------> HEADER SECTION <-----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(IconsaxPlusLinear.edit),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // WHEN TAP IT CALL  AND BOTTOM MODAL UI
                      },

                      child: Container(
                        height: 70,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Text(
                              " Profile",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(IconsaxPlusLinear.setting),
                      ),
                    ),
                  ],
                ),

                //-------------> PROFILE SECTION <-------------
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black, size: 30),
                  ),
                  title: const Text(
                    'David Dafe',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Row(
                    children: const [
                      Text(
                        'Listing on Marketplace',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.storefront_outlined,
                        color: Colors.black54,
                        size: 16,
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      ExperienceCard(
                        icon: IconsaxPlusLinear.video_horizontal,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Ads',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.emoji_happy,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Feedback',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.message_question,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'FAQ',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.notification,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Notification',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.profile_tick,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Followers',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.message_circle,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Chat support',
                      ),

                      ExperienceCard(
                        icon: IconsaxPlusLinear.logout,
                        iconBgColor: Colors.white,
                        iconColor: Colors.black54,
                        title: 'Sign out',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
