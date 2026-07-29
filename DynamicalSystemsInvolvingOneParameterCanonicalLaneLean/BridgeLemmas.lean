import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
