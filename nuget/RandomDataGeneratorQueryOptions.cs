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
        public string Count { get; set; }
    }
}
