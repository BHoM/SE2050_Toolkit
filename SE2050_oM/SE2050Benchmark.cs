using BH.oM.Base;
using BH.oM.Base.Attributes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;

namespace BH.oM.SE2050
{
    [Description("Object description in here. Will appear in the UI tooltip.")]
    public class SE2050Benchmark : BHoMObject
    {
        [Description("Property description in here.")]
        public virtual PrimaryBuildingUseType primaryBuildingUseType { get; set; } = PrimaryBuildingUseType.Undefined; // this will supply the GH component with a default value

        [Description("Property description in here.")]
        public virtual int SomeNumberProperty { get; set; } = 0;
    }
}