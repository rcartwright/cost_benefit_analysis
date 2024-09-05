import { useState } from 'react'
import { useForm } from '@tanstack/react-form'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import {
  Button,
} from '@chakra-ui/react'
import { createBenefit } from '../api/index'
import Modal from './Modal';
import ItemForm from './ItemForm';
import FlashMessage from './FlashMessage'


export function NewBenefit({isOpen, onClose}: {isOpen: boolean, onClose: () => void}) {
  const queryClient = useQueryClient()
  const [flash, setFlash] = 
    useState<{title: string, description: string, status: 'info' | 'warning' | 'success' | 'error' | ''}>({
      title: '',
      description: '',
      status: '',
    });

  const mutation = useMutation({
      mutationFn: createBenefit,
      onSuccess: () => {
        setFlash({
          title: 'Success!',
          description: 'Benefit added successfully.',
          status: 'success',
        });
        // Invalidate and refetch
        queryClient.invalidateQueries({ queryKey: ['fetch-analyses'] })
        onClose()
      },
      onError: () => {
        setFlash({
          title: 'Error',
          description: 'Something went wrong. Please try again.',
          status: 'error',
        });
      },
    })
    
  const form = useForm({
      // setting a default of analysis id of 2 since creation of analyses is not yet implemented
      defaultValues: { description: '', weight: 1, analysisId: 2 },
      onSubmit: ({ value }) =>
        mutation.mutate({
          description: value.description,
          weight: Number(value.weight),
          analysis_id: value.analysisId
        }),
    })

  return (
    <Modal
      isOpen={isOpen} 
      onClose={onClose}
      title={`Add ${name}`} 
      content={
        <>
          <FlashMessage {...flash} />
          <ItemForm form={form} />
        </>
    }
      footer={
        <form.Subscribe
          selector={(state) => [state.isSubmitting]}
          children={([isSubmitting]) => {
            return (
            <Button colorScheme="blue" mr={3} onClick={() => form.handleSubmit()} isLoading={isSubmitting}>
              Save
            </Button>
          )
          }}
        />
      }
    />
  )
}
