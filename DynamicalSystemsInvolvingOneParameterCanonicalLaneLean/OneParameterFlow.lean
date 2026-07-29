import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure OneParameterFlowPackage where
  stateSpace : Type u
  timeDomain : Type v
  timeStructure : Prop
  flowMap : timeDomain → stateSpace → stateSpace
  initialCondition : stateSpace
  parameter : Type w
  parameterDomain : Set parameter
  flowDependsOnParameter : (p : parameter) → timeDomain → stateSpace → stateSpace
  smoothDependence : Prop
  continuity : Prop
  differentiability : Prop

structure OneParameterFlowEvidence (F : OneParameterFlowPackage) where
  timeStructureClosed : F.timeStructure
  initialConditionClosed : True
  smoothDependenceClosed : F.smoothDependence
  continuityClosed : F.continuity
  differentiabilityClosed : F.differentiability

def OneParameterFlowClosed (F : OneParameterFlowPackage) : Prop :=
  F.timeStructure ∧ F.smoothDependence ∧ F.continuity ∧ F.differentiability

theorem one_parameter_flow_closed_from_evidence (F : OneParameterFlowPackage)
    (E : OneParameterFlowEvidence F) : OneParameterFlowClosed F := by
  exact And.intro E.timeStructureClosed
    (And.intro E.smoothDependenceClosed
      (And.intro E.continuityClosed E.differentiabilityClosed))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse