import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure DynamicalSystemAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  oneParameterFlow : Type
  orbit : Prop
  parameterSensitive : Prop
  conclusion : Prop

def SystemWitnessClosed (O : DynamicalSystemAdmittedObject) : Prop :=
  O.conclusion

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse