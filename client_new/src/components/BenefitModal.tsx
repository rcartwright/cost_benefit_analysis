import { useForm } from '@tanstack/react-form'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import {
  FormControl,
  FormLabel,
  FormHelperText,
  Input, 
  Button,
} from '@chakra-ui/react'
import { createBenefit } from '../api/index'
import Modal from './Modal';


const Form = ({ form } : {form: any}) => {
  return (
    <form>
      <form.Field
        name="description"
        children={(field) => (
          <FormControl>
            <FormLabel>Description</FormLabel>
            <Input
              name={field.name}
              value={field.state.value}
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
          </FormControl>
        )}
      />
      <form.Field
        name="weight"
        children={(field) => (
          <FormControl>
            <FormLabel>Weight</FormLabel>
            <Input
              name={field.name}
              value={field.state.value}
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
            <FormHelperText>How important is this from a 1 - 10 scale with 10 being the most important</FormHelperText>
          </FormControl>
        )}
      />
    </form>
  )
}
export function NewBenefit({isOpen, onClose}: {isOpen: boolean, onClose: () => void}) {
  const queryClient = useQueryClient()

  const mutation = useMutation({
      mutationFn: createBenefit,
      onSuccess: () => {
        // Invalidate and refetch
        queryClient.invalidateQueries({ queryKey: ['benefits'] })
      },
    })
    
  const form = useForm({
      defaultValues: {
        description: '',
        weight: '',
        analysisId: ''
      },
      onSubmit: async ({ value }) => {
        // Do something with form data
        console.log(value)
        mutation.mutate({
          description: value.description,
          weight: Number(value.weight),
          analysis_id: 2
        })
      },
  })

  return (
    <Modal
      isOpen={isOpen} 
      onClose={onClose}
      title={`Add ${name}`} 
      content={<Form form={form} />}
      footer={
        <form.Subscribe
          selector={(state) => [state.isSubmitting]}
          children={([isSubmitting]) => (
            <Button colorScheme="blue" mr={3} onClick={() => form.handleSubmit()} isLoading={isSubmitting}>
              Save
            </Button>
          )}
        />
      }
    />
  )
}
