'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "manifest/apple-touch-icon.png": "616fb9d5dd108b953e82b69293977c70",
"manifest/site.webmanifest": "e088152f0fa3827eea0a14b41f6c62b8",
"manifest/mstile-150x150.png": "20609b08641d4778ceff5be5553edcc9",
"manifest/favicon.ico": "2023000ddf68f4951c1a874fe469985f",
"manifest/browserconfig.xml": "772f2bd1ca0fd4b68e12a3202cc00411",
"manifest/android-chrome-192x192.png": "fd736a990b5daa698e53960a1fc224b8",
"manifest/favicon-16x16.png": "63d78a010e7990be86304db31b680b6f",
"manifest/favicon-32x32.png": "ceaa8225ce94292ebc3fc6abe58783de",
"manifest/android-chrome-384x384.png": "56e36a41169648d5c72f0fd662f883e1",
"main.dart.js": "f267456216033158bf728e9333e04ba6",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"style.css": "70cf1a10ef116411fcd6c13ea4783951",
"style.scss": "e0851c1d4288655c0549d8918102440c",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/AssetManifest.json": "cdce3f7f37647dad2ff608be55748fe0",
"assets/shaders/ink_sparkle.frag": "28a404c6523bd094ee13ab7bd8e1534e",
"assets/packages/slimy_card/assets/flare/topSlime.flr": "65ff491b065af4abfb7379c91edad2f7",
"assets/packages/slimy_card/assets/flare/bottomSlime.flr": "ca03aa3f1540b6ddc0711f153f02ae8b",
"assets/FontManifest.json": "92213c3c1148a368eaa8c9930f77e433",
"assets/fonts/Catamaran/static/Catamaran-Regular.ttf": "6d96a0d79326c05382895c87346c92ca",
"assets/fonts/Catamaran/static/Catamaran-Light.ttf": "7af00944494a4d42781ae7207466e9ab",
"assets/fonts/Catamaran/static/Catamaran-Medium.ttf": "b3bb54272b79aefcf2b07d5139ebec0b",
"assets/fonts/Exo2-Regular.ttf": "b5f984d1c21970b20048461157228e26",
"assets/fonts/BrandIconsMinified.ttf": "cd0d861f732e4da00596966a94c0830a",
"assets/fonts/MaterialIconsMinified.ttf": "b775b1128306d1c47ee230e218dd0a2e",
"assets/assets/images/avatar.jpg": "cb3a6c89315137766122462fee361843",
"assets/assets/images/opengraph.png": "117d299d8ab9db2190b2117072c20d31",
"assets/assets/images/favicon_src.png": "e13a9be5e9f80a60ce7a827845970ddb",
"assets/assets/icons/amidoneyet.png": "5654a39c1d41e4846921f27cc9f0126e",
"assets/assets/icons/homingcompass.png": "d16d856f9f34f58186e86886a6a732b6",
"assets/assets/icons/pokeroute.svg": "5ac24ad3646510a231acd41054db6ed7",
"assets/assets/icons/legacyxp.png": "1fcdbe8992123eaaff22cfa522ffff96",
"assets/assets/icons/switchboard.png": "0f35e31734f37ec9cecd57b57644478f",
"assets/assets/icons/ntradeadvanced.png": "d023790cb7a4b0f378d7553308b944c4",
"assets/assets/icons/perfectdecisionfinder.png": "83c429ba0424f2e6f8b761473dab17ce",
"assets/assets/icons/starclock.png": "ca3d275fbe61f67388704d39d75c83a7",
"assets/assets/icons/allout.png": "a5fccd59ea72a4396f3133e98c716e62",
"assets/assets/icons/pokeroute.png": "0cbf7cf98f4516271e247c9973d41784",
"assets/assets/icons/loljournal.png": "c9433b2eff1ee317030736bb12e9d32e",
"assets/assets/icons/sidenote.png": "3ea604cd2c84dfb0e556be7c770ee4c0",
"assets/assets/icons/fridaynightsurvival.png": "f294f3c03fee4e9b20b64662c8ef1fce",
"assets/assets/icons/shadyvault.png": "1995a9d186c5e3858598766201d306ea",
"assets/assets/icons/shufflepaper.png": "e1c8ae789603815f8b421fbbab9d9a3d",
"assets/assets/icons/gabion_configurator.png": "3bd968bf2d91c2ee86212d4a87d96d6c",
"assets/assets/icons/gabion_configurator.svg": "1ae693f0a3fea429e22ec0a2a4cd1598",
"assets/assets/icons/nxtburner.png": "de57a1315fbc18b800c9cf16a4a2e7d2",
"assets/assets/icons/didactduell.png": "9c810910e37dfe421d9b04477a295c5b",
"assets/assets/icons/tagmyknowledge.png": "031f4cde4239ec68725c4886a8fa786d",
"assets/assets/icons/algodat_gui.png": "0ca583201157596b812928ecfcba0754",
"assets/assets/projects.json": "9dae7ec8edc87fb6ca56aab02ccb82be",
"assets/NOTICES": "bb23ae39e80bcdfb325e981abc88c7c0",
"index.html": "27afa795882fcb20a90773cf4718f3e9",
"/": "27afa795882fcb20a90773cf4718f3e9",
"style.css.map": "ddc42bf925f2933f501ee9f7c6daf708",
"favicon.png": "bb0107d24d6e2d23499705b538213c7d",
"version.json": "93f807b928b757d2ee6da6e0cf1df364"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
