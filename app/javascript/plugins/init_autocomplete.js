import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('search');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };
