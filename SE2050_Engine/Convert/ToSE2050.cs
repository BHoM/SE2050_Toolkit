using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BH.oM.Base;
using BH.oM.LifeCycleAssessment;
using BH.Engine.Base;

namespace BH.Engine.SE2050
{
    public static partial class Convert
    {
        /***************************************************/
        /****           Public Methods                  ****/
        /***************************************************/

        public static BuildingBenchmarkingData ToBuildingBenchmarkingData(this CustomObject obj)
        {
            BuildingBenchmarkingData benchmark = new BuildingBenchmarkingData
            {
                High = obj.PropertyValue("High") != null ? System.Convert.ToDouble(obj.PropertyValue("High")) : double.NaN,
                Average = obj.PropertyValue("Average") != null ? System.Convert.ToDouble(obj.PropertyValue("Average")) : double.NaN,
                Low = obj.PropertyValue("Low") != null ? System.Convert.ToDouble(obj.PropertyValue("Low")) : double.NaN,
            };
            return benchmark;
        }
    }
}


