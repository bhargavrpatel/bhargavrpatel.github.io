const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function (eleventyConfig) {
  eleventyConfig.addPlugin(syntaxHighlight);
  eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);

  eleventyConfig.addPassthroughCopy("CNAME");

  eleventyConfig.addPassthroughCopy("./assets/css/style.css");
  eleventyConfig.addPassthroughCopy("./assets/css/normalize.css");
  eleventyConfig.addPassthroughCopy("./assets/css/gridism.css");

  eleventyConfig.addFilter("formatDate", function(date) {
    const months = ["January", "February", "March", "April", "May", "June", "July",
                    "August", "September", "October", "November", "December"];
    const monthName = months[date.getMonth()]; // Extract the month name using the month index
    const year = date.getFullYear(); // Get the full year
    return `${monthName} ${year}`; // Return the formatted string
});

  return {
    dir: {
      input: 'src',
      output: 'output'
    }
  };
};
