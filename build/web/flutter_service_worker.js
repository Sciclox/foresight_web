'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f2acba27288aa2a8745180aad5847592",
"assets/AssetManifest.bin.json": "a59ca3fdee092b3358a5e2ded1f42eee",
"assets/AssetManifest.json": "59a1ad7a3a59ff3286343941bce1929a",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/environment_values/environment.json": "627e865bbde56c48596452fdc161e927",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/1101302545-preview_2.png": "b2d5a85116432edaa4c121ab3ea2659d",
"assets/assets/images/1101302545-preview_2_(1).png": "eb5fb98e9fabfc7c9171674315fa0a60",
"assets/assets/images/3d89fbe132988dd3bb35da65afb99eb0474b5d7a.png": "89b12d7551aba8bbd729e45c4395e8fd",
"assets/assets/images/411252cd051dafa5a608f0f084721b8d3efb0f0f.jpg": "8ed86f6df04a0c36fc885b6f447c7632",
"assets/assets/images/591417d11a25265cafba8e4bf515beac131a7e3d.png": "20df4cc691ced622e0f1a51a7463ed70",
"assets/assets/images/65694dc04b2923a904bd5262253e4bfaa40d0965.png": "bc865a3d40b1c857d4edb5d8604630c6",
"assets/assets/images/a0a88c46221f8b3384c5cfe5e8cca33c320e1eca.png": "c1a8f0d3a3a82cbfddf942680231250a",
"assets/assets/images/bg_circle.png": "99af9c3431ee4db0d6f610f3782969e1",
"assets/assets/images/bg_ellipse_blur_1_(1).png": "1d8447cf1564db85bf10def9cf2c9e18",
"assets/assets/images/bg_ellipse_blur_1_(2).png": "2c6a35cf9305371998f01555be0293a1",
"assets/assets/images/bg_ellipse_blur_2.png": "e1d7ec21cfeda694a76507b1da5915ab",
"assets/assets/images/blur-shadow_1.png": "c7b46c78dbe88eacb20b5436204e636c",
"assets/assets/images/blur-shadow_1_(2).png": "6d105be2650e2f26631ce64481752e13",
"assets/assets/images/blur-shadow_1_(3).png": "f1b1b26863f2a2540413902753f20cdc",
"assets/assets/images/blur-shadow_1_(4).png": "499aa321da75fc21b387e9fda4925ee3",
"assets/assets/images/BTN-R.png": "3ed8c63a72728ad56b66d6c318d41abb",
"assets/assets/images/BTN-R_(1).png": "51cb7e55188b8a3290fada4873e11749",
"assets/assets/images/BTN-R_(2).png": "dcd116e5886f662a135fca198efc76ff",
"assets/assets/images/Captura_de_pantalla_2025-10-29_a_la(s)_1.42.26_p.m._3.png": "28dc773d5c07289d4808cc446b450b25",
"assets/assets/images/Captura_de_pantalla_2025-10-29_a_la(s)_1.42.26_p.m._4.png": "5d9faeddcd29b913444338dc761f159b",
"assets/assets/images/Captura_de_pantalla_2025-10-29_a_la(s)_1.42.26_p.m._5.png": "3d4f6639298e1f9cedd076ef8837e468",
"assets/assets/images/circleblur_-_v02.svg": "7bd3dbf32084b087941818857161f94c",
"assets/assets/images/circleblur_-_v03.svg": "a9e132821d7a354bd7f0c7f906e0c7d0",
"assets/assets/images/da3a97e9b46380e99755b9a85c4a997ff30343de_(1).png": "559f2846f5eee55c5c28c4d12ae10637",
"assets/assets/images/Ellipse_17.png": "00039a8e670b4afc1b635732ecdb6a5d",
"assets/assets/images/escenario1.png": "20df4cc691ced622e0f1a51a7463ed70",
"assets/assets/images/Escenario_1_(2)_8.png": "1aa4d22db2584348eedf17758a19ce8b",
"assets/assets/images/Escenario_1_(2)_9.png": "2d4cc9f8d675b020ac7baae2db6d4103",
"assets/assets/images/Escenario_IMG.png": "ed52714aae1a74d6cae7b23c8768cbc7",
"assets/assets/images/Escenario_IMG_(1).png": "5d44f43aefa91c67562b9f31a49beeb4",
"assets/assets/images/Escenario_IMG_(3).png": "b89809c743bf1167589446a8e29b439e",
"assets/assets/images/Escenario_IMG_(4).png": "015c04723ba285377273a8803c81f4ec",
"assets/assets/images/F5.svg": "9ae1911a67c0ceb4516123b72f2518c9",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/fondocarrusel.png": "06710da6e97ccecc8868763457144918",
"assets/assets/images/habitante.png": "e3ddff3f294d7db80fc27bc2b0be76b5",
"assets/assets/images/Habitante_Rosa_1.png": "9e2638a237f519c13cf6282f63223955",
"assets/assets/images/iapage.gif": "a5873423545ba2aabd6ab3a1dfea51a6",
"assets/assets/images/iaV01.gif": "ebd757ccea6cf300a4a45945ec54f212",
"assets/assets/images/iconPerson.png": "ff5333183349bd64696fb111461177e8",
"assets/assets/images/image.webp": "5fdf6be4cc70d422066f577b13670066",
"assets/assets/images/images1.png": "a78dbf82192832407bfc51d70ac418ab",
"assets/assets/images/images2.png": "a64ccefe9d7c58c575f243def562c782",
"assets/assets/images/images3.png": "5933b25a9192de4f96987391985ae435",
"assets/assets/images/images4.png": "4c975a6720c81215704ed035921f3541",
"assets/assets/images/image_6.png": "e442ec348e38910286e66682e42462dd",
"assets/assets/images/image_8.png": "c08dee4de6ac4cbb3907e6029dd84b0a",
"assets/assets/images/img_content.png": "3e5a72db5bcf4b740dd04f073a7090d1",
"assets/assets/images/img_content_(1).png": "8f0a96360fb93ca02dc257093186b875",
"assets/assets/images/img_lines.png": "ab0f90fdf57eeef18b1f4519583a1c2d",
"assets/assets/images/Juan3_1.png": "3a9383fb8fcae948db66a63c4ad0585d",
"assets/assets/images/lacantera.png": "4c8be986837985686dd11ea71d089fe4",
"assets/assets/images/Logo_F5.svg": "e1d1f30e3052d30f5061c84327e7263a",
"assets/assets/images/Logo_La_Cantera.png": "cbbae6a7e246bd7d0465e0dc5da54c62",
"assets/assets/images/Mask_group.png": "1e025f8bab3bf2c53ce0014907471c68",
"assets/assets/images/ocupacion.png": "2fb9fa2e3341ad3d67f19ea1793e3a14",
"assets/assets/images/pacasmayo.png": "f2700d8087f53e982ba98041c9761ec4",
"assets/assets/images/play.png": "5106a539bf7b95d17ad1023320068abe",
"assets/assets/images/Pyramid.png": "8753ec0cdcc4bacaf5e0a2905492c26d",
"assets/assets/images/Pyramid_(1).png": "d96bd1d63e4765839944873e369446b4",
"assets/assets/images/Pyramid_(2).png": "bfe9acb01f510de6cd1350391c92d7d5",
"assets/assets/images/Pyramid_(3).png": "83591f40b5f41c41a6d681a7d4bf52de",
"assets/assets/images/refuerzo.png": "8f92e7b1f647e7e8f79fda6845ca007d",
"assets/assets/images/Reporte_1_Autoconstruccin.png": "333a74f9220628b50d896ab7e49f84af",
"assets/assets/images/shine02.png": "e8034760c714b3fa8fc7e32207bbab88",
"assets/assets/images/slide1.png": "fcb9629703f9be0dbf9cfbd71b90f9ee",
"assets/assets/images/slide2.png": "c1a8f0d3a3a82cbfddf942680231250a",
"assets/assets/images/slide3.png": "0f74ae475da7446ad6ad13cbf1aeca43",
"assets/assets/images/slide4.png": "0272d997dcd1e062e677f78c41c49470",
"assets/assets/images/slide5.png": "a226fd211f32d3a737d714dcd453d3bd",
"assets/assets/images/slide6.png": "bf63351275d6f9aa336be79dc2d81081",
"assets/assets/images/slide8.jpg": "54216258a63ec607d60afcda1ae01149",
"assets/assets/images/slide9.png": "7c8c68cf41e06444902a31ad6b3892e0",
"assets/assets/images/Social.png": "5fd3f977c7e2ed193bf4606dd3cb6a3d",
"assets/assets/images/State=Default.png": "4c776ed9cc5fbeb246a4e4fba6cc7bc0",
"assets/assets/images/State=Default_(1).png": "ebc493848ae2683a53ebb5f735eb5db6",
"assets/assets/images/State=Default_(2).png": "14901b8adfb28de39b8ebf22930caff1",
"assets/assets/images/Step.png": "ee5a432c6a45cb587bf7d6def3a89c33",
"assets/assets/images/techado.png": "2ca0fccf1a8c891fc4b5087fcbf65b65",
"assets/assets/images/Tecnologia.png": "0b5506a1c962312500e70941f3bfeaac",
"assets/assets/images/Transporte.png": "6cfe951083c6e8339dc7a74b0cc8b5fa",
"assets/assets/images/triangle_1_(1).png": "6f708b3b7bb43b6f594fc58146ff4dd2",
"assets/assets/images/triangle_1_(2).png": "19bd7bec76fee2324ac4864582984811",
"assets/assets/images/triangle_2_(1).png": "b640ca86516b09267e1638bc5c406b06",
"assets/assets/images/Triangle_2_(2).png": "f244284c69970fd3ce5048af7a5fd67e",
"assets/assets/images/Triangle_2_(3).png": "dab2df7d68e88b087b74f40685b822a7",
"assets/assets/images/triangle_3.png": "59272fadb3aaae685d1997153a73c0cb",
"assets/assets/images/triangle_3_(1).png": "720fe80a3892a56dc393145040872443",
"assets/assets/images/Triangle_up.png": "d94c5330f7b98e50fee5a5678ba46888",
"assets/assets/images/Vector.png": "8eaaadc1b15750c3e1e08be4339f1204",
"assets/assets/images/Vector.svg": "47ffae4c10a2108eb5b2a0608e0f8926",
"assets/assets/images/Vector_(1).png": "c821efaa27dd9360a7a5cba4a03ce7ef",
"assets/assets/images/Vector_1.svg": "3bf268160a92cbb642dbd0e0aecffa77",
"assets/assets/images/Vector_1_(1).svg": "1e33994180eaa639d7001ca0a2d230dc",
"assets/assets/images/Vector_2.svg": "2c3188fc3fab02a1b7dc1acfcf486dfe",
"assets/assets/images/Vector_2_(1).svg": "d4db52c8642ebdf869b134fde81d4954",
"assets/assets/images/Vector_44_(1).png": "1dfbcb64d9c3a40835fbc3d8bc34930c",
"assets/assets/images/Vector_45_(1).png": "d64483e10217fa95a3ba0654cae87e73",
"assets/assets/images/Vivienda.png": "b34d4bc98d25f322f597c01f5086b199",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/jsons/irregular_stain.json": "4a892bfdb712664ecd164950bba225c9",
"assets/assets/jsons/mouseScroll2s.json": "17d1af9148ca68583b4cbbd044141f42",
"assets/assets/jsons/shapes_small_01.json": "e4bb990e31ef88e9f5a7d4cad6c8eb10",
"assets/assets/jsons/shape_blue.json": "ce7d84b3045617d5a19d2469fd106b04",
"assets/assets/jsons/shape_pink.json": "f860f229068dd19e6b1b721d97ee2b11",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/3738724407-preview.mp4": "57eacb7437e845f937f37305636d9384",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/ia_1.mp4": "5130ec4c7c9a0d91508f21f45c813cfb",
"assets/assets/videos/WebF5-Reporte-Ttulo.mp4": "f097041aeff2d0b1b109ac520aebc441",
"assets/assets/videos/WebF5-Reporte-Ttulo_1.mp4": "3acbbd8d2d669e69e7d9ae74d2aa1623",
"assets/assets/videos/WebF5Home-Qu_hacemos.mp4": "73a01f33cb7f0958d37f02ae3cfecec1",
"assets/FontManifest.json": "67a28da3784fc091c2f816d615fbf08a",
"assets/fonts/MaterialIcons-Regular.otf": "3fe42bf9c6348b3105708f7a80553793",
"assets/NOTICES": "c81733bd6e0d2779bdbda1cfadaabfe8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "d7d83bd9ee909f8a9b348f56ca7b68c6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "17ee8e30dde24e349e70ffcdc0073fb0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "22ff0756b660b9550f5aac83eb573aa3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "c0272f127bb4dfb4e41eb519b101c588",
"/": "c0272f127bb4dfb4e41eb519b101c588",
"main.dart.js": "ef2aa7dd805f3619ad3e6628be018512",
"version.json": "fec44efd7b48c9c07463436144676e8f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
