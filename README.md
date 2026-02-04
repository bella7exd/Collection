# Collection App - Flutter Intern Assignment

Hi! This is my submission for the Flutter Intern assignment. I built a simple, interactive app that displays product collections with an accordion-style UI. The goal was to make the list expandable and collapsible with smooth animations, just like the design requirements.

## 📱 What It Does
* **Expandable Cards:** You can tap on any collection to expand it.
* **One Open at a Time:** I added logic to make sure only one card stays open at a time. If you open a new one, the previous one closes automatically.
* **Dynamic Image Preview:**
    * When collapsed, it shows a horizontal row of preview images.
    * If a collection has more than 4 images, I calculated the difference and added a `+N` overlay (like `+3`) on the last image.
* **Smooth Animations:** I used `AnimatedCrossFade` to make the switch between the horizontal row and the vertical list feel really smooth.

## 🛠️ How I Built It
* **Flutter & Dart**: The core framework.
* **ListView.builder**: I used this so the list can handle any number of collections efficiently (good for performance).
* **State Management**: I kept it simple using `setState` to track the `selectedIndex` (the ID of the currently open card).


## 📸 Pr![WhatsApp Image 2026-02-05 at 12 14 56 AM](https://github.com/user-attachments/assets/7c1fe6db-fb15-4c05-a38a-d9c2fd896e24)
oject Screenshots
![Uploading WhatsApp Image 2026-02-05 at 12.14.56 AM.jpeg…]()
![WhatsApp Image 2026-02-05 at 12 14 59 AM](https://github.com/user-attachments/assets/e692f999-6a85-437a-b35c-97732361f6a7)

*Thanks for checking out my code!*
