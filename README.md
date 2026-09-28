# Google Maps & Geocoding Studio (POC)

Een standalone, 100% werkende webapplicatie en herbruikbare component voor Google Places autocomplete, geocoding en interactieve Airbnb-stijl kaartpin positionering.

## 🚀 Live Demo (GitHub Pages)

👉 **[https://gj915427.github.io/google-maps-studio/](https://gj915427.github.io/google-maps-studio/)**

---

## 🔒 Beveiliging van de Google Maps API-sleutel

Omdat dit een statische client-side website (POC) is die je deelt met enkele personen, is de aanbevolen beveiligingsmethode van Google Cloud:

1. Ga naar de **[Google Cloud Console](https://console.cloud.google.com/apis/credentials)**.
2. Klik op jouw API-sleutel om deze te bewerken.
3. Onder **Toepassingsbeperkingen (Application restrictions)**:
   - Kies **Websites (HTTP-verwijzingsbronnen / HTTP referrers)**.
   - Voeg de volgende URL's toe:
     - `https://gj915427.github.io/*`
     - `http://localhost:*`
     - `http://127.0.0.1:*`
4. Onder **API-beperkingen (API restrictions)**:
   - Beperk de sleutel tot:
     - *Maps JavaScript API*
     - *Places API (New)*
     - *Geocoding API*
5. Klik op **Opslaan**.

> **Resultaat:** Zelfs als iemand de broncode bekijkt, kan de sleutel **nergens anders** worden gebruikt. Google weigert automatisch alle verzoeken die niet afkomstig zijn van jouw GitHub Pages domein of jouw lokale ontwikkelomgeving.

---

## ✨ Functionaliteiten

- **Google Maps & Places API (New):** Live adres autocomplete en gestructureerde adresparsing.
- **Airbnb-stijl Vaste Speld:** Kaart beweegt onder de speld door en kalibreert automatisch coördinaten.
- **Reverse & Forward Geocoding:** Direct adres herkennen vanaf de kaart en visa versa.
- **Privacy Cirkel Toggle:** Schakel tussen exacte speld en een indicatieve radiuszone (100m - 1500m).
- **Dual-Engine Fallback:** Ondersteunt ook Leaflet / OpenStreetMap zonder API-sleutel.
- **JSON Export Hub:** Direct het gestructureerde `locationSettings` JSON-object kopiëren.
