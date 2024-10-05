import 'package:car_rental_app/core/colors/colors.dart';
import 'package:flutter/material.dart';
// TODO: add flutter_svg to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: accountIcon,
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: notification,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: settingsIcon,
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: helpIcon,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: logOutIcon,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.string(cameraIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: ThemeColors.primary,
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.string(icon),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: ThemeColors.primary,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),
            ),
          ],
        ),
      ),
    );
  }
}

const cameraIcon =
    '''<svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10 12.0152C8.49151 12.0152 7.26415 10.8137 7.26415 9.33902C7.26415 7.86342 8.49151 6.6619 10 6.6619C11.5085 6.6619 12.7358 7.86342 12.7358 9.33902C12.7358 10.8137 11.5085 12.0152 10 12.0152ZM10 5.55543C7.86698 5.55543 6.13208 7.25251 6.13208 9.33902C6.13208 11.4246 7.86698 13.1217 10 13.1217C12.133 13.1217 13.8679 11.4246 13.8679 9.33902C13.8679 7.25251 12.133 5.55543 10 5.55543ZM18.8679 13.3967C18.8679 14.2226 18.1811 14.8935 17.3368 14.8935H2.66321C1.81887 14.8935 1.13208 14.2226 1.13208 13.3967V5.42346C1.13208 4.59845 1.81887 3.92664 2.66321 3.92664H4.75C5.42453 3.92664 6.03396 3.50952 6.26604 2.88753L6.81321 1.41746C6.88113 1.23198 7.06415 1.10739 7.26604 1.10739H12.734C12.9358 1.10739 13.1189 1.23198 13.1877 1.41839L13.734 2.88845C13.966 3.50952 14.5755 3.92664 15.25 3.92664H17.3368C18.1811 3.92664 18.8679 4.59845 18.8679 5.42346V13.3967ZM17.3368 2.82016H15.25C15.0491 2.82016 14.867 2.69466 14.7972 2.50917L14.2519 1.04003C14.0217 0.418041 13.4113 0 12.734 0H7.26604C6.58868 0 5.9783 0.418041 5.74906 1.0391L5.20283 2.50825C5.13302 2.69466 4.95094 2.82016 4.75 2.82016H2.66321C1.19434 2.82016 0 3.98846 0 5.42346V13.3967C0 14.8326 1.19434 16 2.66321 16H17.3368C18.8057 16 20 14.8326 20 13.3967V5.42346C20 3.98846 18.8057 2.82016 17.3368 2.82016Z" fill="#03045E"/>
</svg>
''';


const accountIcon = ''' <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" color="currentColor"><path d="M14 9h4m-4 3.5h3"/><rect width="20" height="18" x="2" y="3" rx="5"/><path d="M5 16c1.208-2.581 5.712-2.75 7 0m-1.5-7a2 2 0 1 1-4 0a2 2 0 0 1 4 0"/></g></svg>''';
const notification = ''' <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 32 32"><path fill="currentColor" d="M26 16.586V14h-2v3a1 1 0 0 0 .293.707L27 20.414V22H5v-1.586l2.707-2.707A1 1 0 0 0 8 17v-4a7.985 7.985 0 0 1 12-6.917V3.846a9.9 9.9 0 0 0-3-.796V1h-2v2.05A10.014 10.014 0 0 0 6 13v3.586l-2.707 2.707A1 1 0 0 0 3 20v3a1 1 0 0 0 1 1h7v1a5 5 0 0 0 10 0v-1h7a1 1 0 0 0 1-1v-3a1 1 0 0 0-.293-.707ZM19 25a3 3 0 0 1-6 0v-1h6Z"/><circle cx="26" cy="8" r="4" fill="currentColor"/></svg> ''';
const settingsIcon = ''' <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="m20.35 8.923l-.366-.204l-.113-.064a2 2 0 0 1-.67-.66c-.018-.027-.034-.056-.066-.112a2 2 0 0 1-.3-1.157l.006-.425c.012-.68.018-1.022-.078-1.328a2 2 0 0 0-.417-.736c-.214-.24-.511-.412-1.106-.754l-.494-.285c-.592-.341-.889-.512-1.204-.577a2 2 0 0 0-.843.007c-.313.07-.606.246-1.191.596l-.003.002l-.354.211c-.056.034-.085.05-.113.066c-.278.155-.588.24-.907.25c-.032.002-.065.002-.13.002l-.13-.001a2 2 0 0 1-.91-.252c-.028-.015-.055-.032-.111-.066l-.357-.214c-.589-.354-.884-.53-1.199-.601a2 2 0 0 0-.846-.006c-.316.066-.612.238-1.205.582l-.003.001l-.488.283l-.005.004c-.588.34-.883.512-1.095.751a2 2 0 0 0-.415.734c-.095.307-.09.649-.078 1.333l.007.424c0 .065.003.097.002.128a2 2 0 0 1-.301 1.027c-.033.056-.048.084-.065.11a2 2 0 0 1-.675.664l-.112.063l-.361.2c-.602.333-.903.5-1.121.738a2 2 0 0 0-.43.73c-.1.307-.1.65-.099 1.338l.002.563c.001.683.003 1.024.104 1.329a2 2 0 0 0 .427.726c.218.236.516.402 1.113.734l.358.199c.061.034.092.05.121.068a2 2 0 0 1 .74.781l.067.12a2 2 0 0 1 .23 1.038l-.007.407c-.012.686-.017 1.03.079 1.337c.085.272.227.523.417.736c.214.24.512.411 1.106.754l.494.285c.593.341.889.512 1.204.577a2 2 0 0 0 .843-.007c.314-.07.607-.246 1.194-.598l.354-.212l.113-.066c.278-.154.588-.24.907-.25l.13-.001h.13c.318.01.63.097.91.252l.092.055l.376.226c.59.354.884.53 1.199.6a2 2 0 0 0 .846.008c.315-.066.613-.239 1.206-.583l.495-.287c.588-.342.883-.513 1.095-.752c.19-.213.33-.463.415-.734c.095-.305.09-.644.078-1.318l-.008-.44v-.127a2 2 0 0 1 .3-1.028l.065-.11a2 2 0 0 1 .675-.664l.11-.061l.002-.001l.361-.2c.602-.334.903-.5 1.122-.738c.194-.21.34-.46.429-.73c.1-.305.1-.647.098-1.327l-.002-.574c-.001-.683-.002-1.025-.103-1.33a2 2 0 0 0-.428-.725c-.217-.236-.515-.402-1.111-.733z"/><path d="M8 12a4 4 0 1 0 8 0a4 4 0 0 0-8 0"/></g></svg> ''';
const helpIcon = '''<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12.028 17.23q.332 0 .56-.228t.228-.56t-.23-.56q-.228-.228-.56-.228t-.56.229t-.227.56q0 .332.228.56q.23.228.561.228m-.517-3.312h.966q.038-.652.245-1.06q.207-.407.851-1.04q.67-.669.996-1.199t.327-1.226q0-1.182-.83-1.884q-.831-.702-1.966-.702q-1.079 0-1.832.586q-.753.587-1.103 1.348l.92.381q.24-.546.687-.965q.447-.42 1.29-.42q.972 0 1.42.534q.449.534.449 1.174q0 .52-.281.928q-.28.409-.73.822q-.87.802-1.14 1.36t-.269 1.363M12.003 21q-1.866 0-3.51-.708q-1.643-.709-2.859-1.924t-1.925-2.856T3 12.003t.709-3.51Q4.417 6.85 5.63 5.634t2.857-1.925T11.997 3t3.51.709q1.643.708 2.859 1.922t1.925 2.857t.709 3.509t-.708 3.51t-1.924 2.859t-2.856 1.925t-3.509.709M12 20q3.35 0 5.675-2.325T20 12t-2.325-5.675T12 4T6.325 6.325T4 12t2.325 5.675T12 20m0-8"/></svg> ''';
const logOutIcon = '''<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M5 3h6a3 3 0 0 1 3 3v4h-1V6a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v13a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-4h1v4a3 3 0 0 1-3 3H5a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3m3 9h11.25L16 8.75l.66-.75l4.5 4.5l-4.5 4.5l-.66-.75L19.25 13H8z"/></svg> ''';

