import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.BifurcationAnalysis
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.InvariantManifold

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.endpointSatisfied

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedDynamicalSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_systems_endgame (A : AdmissibleClass) :
    ConstrainedDynamicalSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse