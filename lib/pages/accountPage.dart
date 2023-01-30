import 'package:doctor_app/api/apis.dart';
import 'package:doctor_app/controller/doctorSignUpController.dart';
import 'package:doctor_app/controller/loginController.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/profile_list_item.dart';

class ProfileScrean extends StatelessWidget {
  const ProfileScrean({super.key});
  @override
  Widget build(BuildContext context) {
    // ImamSignUp controller = Get.put(ImamSignUp(),permanent: true);
    DoctorSignUpController controller = Get.find();
    return Scaffold(
      backgroundColor: appBgColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppBarButton(
                        icon: Icons.arrow_back,
                      ),
                      // SvgPicture.asset("assets/icons/menu.svg"),
                    ],
                  ),
                ),
                AvatarImage(imageUrl: controller.doctorData['image']),
                const SizedBox(
                  height: 20,
                ),
                // const SocialIcons(),
                // const SizedBox(height: 30),
                if (controller.doctorData['name'] == null)
                  const CircularProgressIndicator()
                else
                  Text(
                    // 'chromicle',
                    controller.doctorData['name'].toString(),
                    // controller.box.read('userName'),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      // fontFamily: "Poppins",
                    ),
                  ),
                controller.doctorData['email'] == null
                    ? const CircularProgressIndicator()
                    : Text(
                        // '@amFOSS',
                        controller.doctorData['email'].toString(),
                        // controller.box.read('email'),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                const SizedBox(height: 15),
                // const Text(
                //   'Mobile App Developer and Open source enthusiastic',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 20, fontFamily: "Poppins"),
                // ),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: Visibility(
      //     visible: controller.doctorData!.userType == "imam" ? true : false,
      //     child: FloatingActionButton(
      //       onPressed: () {
      //         Get.to( AddServiceScreen());
      //       },
      //       child: const Icon(Icons.add),
      //     ) // child: IconButton(
      //     //     onPressed: () {
      //     //       Get.to(const AddServiceScreen());
      //     //     },
      //     //     icon: const Icon(Icons.add)),
      //     ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData? icon;

  const AppBarButton({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: primary, boxShadow: [
        BoxShadow(
          color: mainColor,
          offset: const Offset(1, 1),
          blurRadius: 10,
        ),
        BoxShadow(
          color: appBgColor,
          offset: const Offset(-1, -1),
          blurRadius: 10,
        ),
      ]),
      child: Icon(
        icon,
        // color: Colors.deepPurpleAccent,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  AvatarImage({super.key, this.imageUrl});
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: primary, boxShadow: [
        BoxShadow(
          color: appBgColor,
          offset: const Offset(10, 10),
          blurRadius: 10,
        ),
        BoxShadow(
          color: appBgColor,
          offset: const Offset(-10, -10),
          blurRadius: 10,
        ),
      ]),
      child: Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: primary, boxShadow: [
          BoxShadow(
            color: appBgColor,
            offset: const Offset(10, 10),
            blurRadius: 10,
          ),
          BoxShadow(
            color: appBgColor,
            offset: const Offset(-10, -10),
            blurRadius: 10,
          ),
        ]),
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(imageUrl!), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

// class SocialIcons extends StatelessWidget {
//   const SocialIcons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SocialIcon(
//           color: const Color(0xFF102397),
//           iconData: facebook,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFFff4f38),
//           iconData: googlePlus,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFF38A1F3),
//           iconData: twitter,
//           onPressed: () {},
//         ),
//         SocialIcon(
//           color: const Color(0xFF2867B2),
//           iconData: linkedin,
//           onPressed: () {},
//         )
//       ],
//     );
//   }
// }

class SocialIcon extends StatelessWidget {
  final Color? color;
  final IconData? iconData;
  final VoidCallback? onPressed;

  const SocialIcon({super.key, this.color, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileListItem(
          icon: LineAwesomeIcons.user_shield,
          text: 'سياسة الخصوصية',
        ),
        // ProfileListItem(
        //   icon: LineAwesomeIcons.history,
        //   text: 'قائمة الخدمات',
        // ),
        ProfileListItem(
          icon: LineAwesomeIcons.question_circle,
          text: 'الدعم والمساعدة',
        ),
        ProfileListItem(
          icon: LineAwesomeIcons.cog,
          text: 'الاعدادات',
        ),
        ProfileListItem(
          icon: LineAwesomeIcons.user_plus,
          text: 'دعوة الاصدقاء',
        ),
        ProfileListItem(
          press: () {
            APIs.logOut();
          },
          icon: LineAwesomeIcons.alternate_sign_out,
          text: 'تسجيل خروج',
          hasNavigation: false,
        ),
      ],
    );
  }
}
