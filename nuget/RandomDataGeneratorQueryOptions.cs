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
        /// The type of random data to generate (e.g., number, dice, phone, date, coin, uuid, guid, color, name, email, username, address)
        /// Example: number
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// The number of random data to generate
        /// Example: 1
        /// </summary>
        [JsonProperty("count")]
        public string Count { get; set; }
    }
}
