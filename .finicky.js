// ~/.finicky.js

module.exports = {
  defaultBrowser: "Safari",
  rewrite: [
    {
      // Redirect all non-local urls to use https
      match: ({ url }) => url.protocol === "http" && url.host !== "localhost",
      url: { protocol: "https" }
    }
  ],
  handlers: [
    {
      // Open google.com and *.google.com urls in Google Chrome
      match: [
        "google.com/*", // match google.com urls
        "*.google.com/*", // match google.com subdomains
        "vsphere*", // match vmware vsphere urls
        "vcenter*",
      ],
      browser: "Google Chrome"
    }
  ]
};
