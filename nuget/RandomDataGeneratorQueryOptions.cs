using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.RandomDataGenerator
{
    /// <summary>
    /// Query options for the Random Data Generator API
    /// </summary>
    public class RandomDataGeneratorQueryOptions
    {
        /// <summary>
        /// The type of random data to generate
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// The number of random data to generate (1 to 100)
        /// </summary>
        [JsonProperty("count")]
        public int? Count { get; set; }

        /// <summary>
        /// Include an AI-generated face avatar (only applies when type=name)
        /// </summary>
        [JsonProperty("includeAvatar")]
        public bool? IncludeAvatar { get; set; }

        /// <summary>
        /// Smallest number to draw, inclusive (type=number). Defaults to 0
        /// </summary>
        [JsonProperty("min")]
        public double? Min { get; set; }

        /// <summary>
        /// Largest number to draw, inclusive (type=number). Defaults to 999999
        /// </summary>
        [JsonProperty("max")]
        public double? Max { get; set; }

        /// <summary>
        /// Decimal places for type=number (0 to 10); 0 draws whole numbers
        /// </summary>
        [JsonProperty("decimals")]
        public int? Decimals { get; set; }

        /// <summary>
        /// Draw without repeats (type=number with whole numbers, or type=dice)
        /// </summary>
        [JsonProperty("unique")]
        public bool? Unique { get; set; }

        /// <summary>
        /// Number of sides on each die for type=dice (2 to 1000)
        /// </summary>
        [JsonProperty("sides")]
        public int? Sides { get; set; }

        /// <summary>
        /// Length of each value for type=string (1 to 256)
        /// </summary>
        [JsonProperty("length")]
        public int? Length { get; set; }

        /// <summary>
        /// Characters for type=string
        /// </summary>
        [JsonProperty("charset")]
        public string Charset { get; set; }
    }
}
