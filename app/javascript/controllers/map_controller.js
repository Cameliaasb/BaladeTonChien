import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static targets = ["map"]

  static values = {
    apiKey: String,
    markers: Array,
    type: String,
    coordinates: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/cameliaasb/cll0p0q0z009h01pmetfpa29d"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#geolocalisation()


    if (this.typeValue) {
      this.map.on('load', () => {
        this.map.addSource('route', {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': this.typeValue,
              'coordinates': this.coordinatesValue
            },
          }
        });
        this.map.addLayer({
          'id': 'route',
          'type': 'line',
          'source': 'route',
          'layout': {
            'line-join': 'round',
            'line-cap': 'round'
          },
          'paint': {
            'line-color': '#FD1015',
            'line-width': 6
          }
        });
      });
    }
  }


  #geolocalisation() {
    this.map.addControl(
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true
      })
    );
  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({closeButton: false}).setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    if (this.typeValue) {
      const boundsOptions = { padding: 70, maxZoom: 11.5, duration: 0 }
      this.map.fitBounds(bounds, boundsOptions)
    } else {
      const boundsOptions = { padding: 70, maxZoom: 14, duration: 0 }
      this.map.fitBounds(bounds, boundsOptions)
    }
  }

}
