# 🏠 iOS Airbnb Clone UI

An Airbnb-style property listing and detail app built with **SwiftUI**. This project replicates core UI components of the Airbnb app including an explore page, detailed property views, amenities, host info, and interactive maps.
Taught by:https://youtu.be/-ad4qLKep3U?si=Ln8Npsk3iLbEWDZf
---

## 📱 Features

- 🗺️ Explore view with scrollable listings
- 🏨 Detailed `ListingDetailView` with:
  - Title, rating, location, host info
  - Image carousel (custom view)
  - Features and amenities display
  - Horizontal scrollable bedrooms section
  - Dynamic Apple Maps integration with camera positioning
- 💬 Review summary section (static placeholder)
- 💵 Booking summary with date and price (static)
- 🔙 Back navigation with dismiss button

---

## 🧩 Tech Stack

- **Language**: Swift
- **Framework**: SwiftUI
- **Location**: MapKit (iOS 17+ with `MapCameraPosition`)
- **Architecture**: MVVM (Model-View-ViewModel) pattern
- **Previewing**: SwiftUI Live Preview
- **Mock Data**: `DeveloperPreview.shared`

---

## 🧪 Screens

> Add screenshots of the Explore view and ListingDetailView here (optional).

---

## 🗂 Project Structure

IOS_AIRBNB_CLONE_UI/
├── Views/
│ ├── ExploreView.swift
│ └── ListingDetailView.swift
├── Models/
│ ├── Listing.swift
│ ├── ListingFeatures.swift
│ ├── ListingAmenities.swift
│ └── ListingType.swift
├── Components/
│ └── listingImageCarasoulView.swift
├── Preview/
│ └── DeveloperPreview.swift
└── Assets/
└── Images and Icons

yaml
Copy
Edit

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Advaithdp02/IOS_AIRBNB_CLONE_UI.git
cd IOS_AIRBNB_CLONE_UI
```
2. Open in Xcode
```bash
open IOS_AIRBNB_CLONE_UI.xcodeproj
```
3. Run the App
-Select the target device or simulator.

-Press Cmd + R or tap the Run button in Xcode.

📍 ListingDetailView Highlights
swift
```bash
init(listing: Listing) {
    self.listing = listing
    let region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    self._cameraPosition = State(initialValue: .region(region))
}
```
```bash
swift

Map(position: $cameraPosition)
    .frame(height: 200)
    .clipShape(RoundedRectangle(cornerRadius: 12))
```
📦 Future Enhancements
✅ Real-time booking date pickers

✅ Integrated backend for dynamic listings

✅ User authentication and favorites

✅ Reviews section with user profiles

✅ Light/Dark mode UI consistency

🧾 License
This project is open-source and available under the MIT License.

🤝 Contributing
Pull requests and issues are welcome. Please fork the repo and submit a PR for review.

👨‍💻 Author
Advaith Dinesan

